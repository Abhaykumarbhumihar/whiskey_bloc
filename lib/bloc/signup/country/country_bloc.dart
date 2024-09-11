import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/model/signup/CityByZipPojo.dart';

import '../../../UI/intropage/auth_repository.dart';
import '../../../model/signup/country_list.dart';
import '../../../untils/widget/commonUtility.dart';
import '../../../webfile/apiservices.dart';
import '../../../webfile/appConstant.dart';
import '../registerationBloc/registeration_form_bloc.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  RegisterationFormBloc registerationFormBloc;
  CountryBloc(this.registerationFormBloc) : super(CountryState.initial()) {
    on<CountryListEvent>(getCountryList);
    on<CityByZipEvent>(getCityByZipCode);
  }

  Future<void> getCountryList(
      CountryListEvent event, Emitter<CountryState> emit) async {
    if (await CommonUtility.isInternetConnected()) {
      emit(state.copyWith(isLoading: true));
      dynamic countryData = await AuthRepository.getCOuntry();
      print(countryData);
      var data = json.decode(countryData.body);
      print(data);
      emit(state.copyWith(
          isLoading: false, countryPojo: CountryPojo.fromJson(data)));


    } else {
      emit(state.copyWith(message: AppConstant.INTERNETCCONNECTIONS));
    }
  }

  Future<void> getCityByZipCode(
      CityByZipEvent event, Emitter<CountryState> emit) async {
    if (await CommonUtility.isInternetConnected()) {
      emit(state.copyWith(isLoading: true));
      Map<String, dynamic> data = {"zipcode": event.zipcode};
print("_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+");
      print(data);
      dynamic zipList = await AuthRepository.getCITYBYZIPCODE(data);
      var zipListData = json.decode(zipList.body);

      if (zipListData['status'] == true) {
        var d = CityByZipPojo.fromJson(zipListData);
        emit(state.copyWith(
            isLoading: false,
            cityByZipPojo: d));
       registerationFormBloc.add(UpdateCityEvent(d.data?.physicalCity??"N/A"));
       registerationFormBloc.add(UpdateStateEvent(d.data?.physicalState??"N/A"));
       registerationFormBloc.add(UpdateZipcodeEvent(d.data?.physicalZip??"N/A"));

      } else {
        emit(state.copyWith(message: "Something goes wrong"));
      }
    } else {
      emit(state.copyWith(message: AppConstant.INTERNETCCONNECTIONS));
    }
  }
}
