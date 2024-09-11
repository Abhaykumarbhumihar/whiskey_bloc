import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../UI/intropage/auth_repository.dart';
import '../../../untils/local/SharedPrefs.dart';
import '../../../untils/widget/commonUtility.dart';
import '../../../webfile/appConstant.dart';
import '../registerationBloc/registeration_form_bloc.dart';

part 'registeration_submit_event.dart';

part 'registeration_submit_state.dart';

class RegisterationSubmitBloc
    extends Bloc<RegisterationSubmitEvent, RegisterationSubmitState> {
  RegisterationFormBloc registerationFormBloc;

  RegisterationSubmitBloc(this.registerationFormBloc)
      : super(RegisterationSubmitInitial()) {
    on<RegisterationStart>(submitRegisteration);
  }

  Future<void> submitRegisteration(RegisterationStart event,
      Emitter<RegisterationSubmitState> emit) async {
    String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);

    if (registerationFormBloc.state.firstname
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter your first name.'));
      return;
    }

    if (registerationFormBloc.state.lastname
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter your last name.'));
      return;
    }

    if (registerationFormBloc.state.screenname
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter your screen name.'));
      return;
    }

    // if (registerationFormBloc.state.email
    //     .trim()
    //     .isEmpty) {
    //   emit(RegisterationSubmitError('Please enter a valid email address.'));
    //   return;
    // }

    if (registerationFormBloc.state.dob
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter a valid birth year.'));
      return;
    }

    if (registerationFormBloc.state.country
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter your country.'));
      return;
    }

    if (registerationFormBloc.state.zipcode
        .trim()
        .isEmpty) {
      print(registerationFormBloc.state.zipcode);
      emit(RegisterationSubmitError('Please enter a valid zip code.'));
      return;
    }

    if (registerationFormBloc.state.state
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter a valid state.'));
      return;
    }

    if (registerationFormBloc.state.city
        .trim()
        .isEmpty) {
      emit(RegisterationSubmitError('Please enter your city.'));
      return;
    }

    if (registerationFormBloc.state.tweeterurl.isNotEmpty &&
        !regExp.hasMatch(registerationFormBloc.state.tweeterurl)) {
      emit(RegisterationSubmitError('Please enter a valid Twitter URL.'));
      return;
    }

    if (registerationFormBloc.state.facebookurl.isNotEmpty &&
        !regExp.hasMatch(registerationFormBloc.state.facebookurl)) {
      emit(RegisterationSubmitError('Please enter a valid Facebook URL.'));
      return;
    }

    if (registerationFormBloc.state.instagramurl.isNotEmpty &&
        !regExp.hasMatch(registerationFormBloc.state.instagramurl)) {
      emit(RegisterationSubmitError('Please enter a valid Instagram URL.'));
      return;
    }

    print(registerationFormBloc.state.toMap());
    if (await CommonUtility.isInternetConnected()) {
      registerationFormBloc.add(RegisterationFormLoadingEvent());

      dynamic uploadImageData = await AuthRepository.updateProfile(
          registerationFormBloc.state.toMap());
      var data = json.decode(uploadImageData.body);
      registerationFormBloc.add(RegisterationFormInitialEvent());
      var code = data['code'];
      var message = data['message'];
      print(data);
      if (code == 200) {
        SharedPrefs.setString("profilecomplete", "1");
        SharedPrefs.setString("email", data['data']['email'] ?? "");
        SharedPrefs.setString("screenName", data['data']['user_name'] ?? "");
        SharedPrefs.setString("username", data['data']['first_name'] ?? "");
        SharedPrefs.setString("lastName", data['data']['last_name'] ?? "");
      } else {
        emit(RegisterationSubmitError(message));
     }
    } else {
    emit(RegisterationSubmitError(AppConstant.INTERNETCCONNECTIONS));
    }
  }
}
