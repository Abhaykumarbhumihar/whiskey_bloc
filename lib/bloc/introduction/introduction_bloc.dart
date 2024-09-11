import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whiskey_with_bloc/model/introduction/IntroductinPojo.dart';

import '../../model/splash/SplashPojo.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../webfile/repositery/splash_repo/splash_intro.dart';

part 'introduction_event.dart';

part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final controllerPager = PageController(initialPage: 0);
  int setCurrentPageValue=0;
  IntroductionBloc() : super(IntroductionInitial()) {
    on<FetchIntroductionEvent>(getIntroductionData);
  }

  Future<void> getIntroductionData(
      FetchIntroductionEvent event, Emitter<IntroductionState> emit) async {
    emit(IntroductionLoading());
    try {
      var type = event.type ?? "";
      dynamic splashData = await SplashRepository.getIntroData();
      var data = json.decode(splashData.body);
      if (data['code'] == 200) {
        var loadedData = IntroductinPojo.fromJson(data);
        emit(IntroductionSuccess(loadedData));
      } else {
        emit(IntroductionError(data["message"]));
      }
    } catch (e) {
      emit(IntroductionError(e.toString()));
    }
  }
}
