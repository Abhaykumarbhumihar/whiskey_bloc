import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:whiskey_with_bloc/model/signup/check_email.dart';

import '../../../UI/intropage/auth_repository.dart';
import '../../../untils/local/SharedPrefs.dart';
import '../../../untils/validation.dart';
import '../../../untils/widget/commonUtility.dart';
import '../../../webfile/appConstant.dart';
import '../checkuserage/check_user_age_bloc.dart';
import '../verify_otp_bloc.dart';

part 'check_email_event.dart';

part 'check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final VerifyOtpBloc verifyOtpBloc;

  final TextEditingController emailControllerSignup = TextEditingController();
  final TextEditingController passwordControllerSignup =
      TextEditingController();
  final TextEditingController confirmPasswordControllerSignup =
      TextEditingController();


  CheckEmailBloc(this.verifyOtpBloc) : super(CheckEmailInitial()) {
    on<StartCheckEmailEvent>(verifyEmail);
    on<CheckEmailSuccessMakeTickEvent>(checkEmailTick);
    on<RegisterUserEvent> (registerUser);

  }




  Future<void> verifyEmail(
      StartCheckEmailEvent event, Emitter<CheckEmailState> emit) async {
    String email = emailControllerSignup.text;

    String? emailValidationMessage = Validation.validateEmail(email);
    if (emailValidationMessage != null) {
      //  print(emailValidationMessage);
      emit(CheckEmailError(
          CheckEmailPojo(code: 101, message: emailValidationMessage)));
      CommonUtility.showSnackbarValidationError(emailValidationMessage);
      return;
    }
    if (await CommonUtility.isInternetConnected()) {
      emit(CheckEmailLoading());

      dynamic verifyEmailData = await AuthRepository.verifyEmail(email);

      var data = json.decode(verifyEmailData.body);

      var code = data['code'];
      var message = data['message'];

      if (code == 200) {

         verifyOtpBloc.add(StartTimerEvent());
        emit(CheckEmailSuccess(CheckEmailPojo.fromJson(data)));

      } else {
        emit(CheckEmailError(CheckEmailPojo(code: 101, message: message)));
      }
    } else {
      emit(CheckEmailError(CheckEmailPojo(
          code: 101, message: AppConstant.INTERNETCCONNECTIONS)));
    }
  }


  Future<void> registerUser(RegisterUserEvent event, Emitter<CheckEmailState> emit) async {
    // Use the values passed in the event
    final emailVerified = event.isEmailVerified;
    final ageChecked = event.isAbove21;
    String password = passwordControllerSignup.text.trim();
    String confirmPassword = confirmPasswordControllerSignup.text.trim();
    String email = emailControllerSignup.text.trim();
    String? emailValidationMessage = Validation.validateEmail(email);
    if (emailValidationMessage != null) {
      // print(emailValidationMessage);
      emit(CheckEmailError(CheckEmailPojo(code: 101, message: emailValidationMessage)));

      return;
    }

    String? passwordValidationMessage = Validation.validatePassword(password);
    if (passwordValidationMessage != null) {
      print(passwordValidationMessage);
      emit(CheckEmailError(CheckEmailPojo(code: 101, message: passwordValidationMessage)));

      return;
    }

    if (password != confirmPassword) {
      print("Passwords do not match");

      emit(CheckEmailError(CheckEmailPojo(code: 101, message: "Passwords do not match")));
      return;
    }
    if (!emailVerified) {
      emit(CheckEmailError(CheckEmailPojo(code: 101, message: "Please verify your email first.")));
      return;
    }

    if (!ageChecked) {
      emit(CheckEmailError(CheckEmailPojo(code: 102, message: "Please confirm you are 21 years or older.")));
      return;
    }

    if (await CommonUtility.isInternetConnected()) {
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

      Map<String, dynamic> map = {
        "email": email,
        "password": password,
        "timezone": '${currentTimeZone}',
        "is_biometric_enabled": "1"
      };
      emit(CheckEmailLoading());
      dynamic signUpData = await AuthRepository.register(map);
      var data = json.decode(signUpData.body);
      var code = data['code'];
      var message = data['message'];
      if (code == 200) {
         SharedPrefs.setString("bemail", email ?? "");
         SharedPrefs.setString("bpassword", password ?? "");
         SharedPrefs.setString("email", data['data']['email'] ?? "");
         SharedPrefs.setString(
             "xcrftoken", data['tokens']['x-csrf-token'] ?? "");
         SharedPrefs.setString(
             "accesstoken", data['tokens']['access']['token'] ?? "");
         SharedPrefs.setString(
             "refreshToken", data['tokens']['refresh']['token'] ?? "");
         SharedPrefs.getString("refreshToken");
         SharedPrefs.setInt(
             "profilecomplete", data['data']['profile_completed']+"" ?? "0");
         SharedPrefs.setString('userid', data['data']['_id'] ?? "");

        emailControllerSignup.clear();
        passwordControllerSignup.clear();
        confirmPasswordControllerSignup.clear();
        print(data);
        emit(RegisterUserSuccess(data));


      } else {
        CommonUtility.showSnackbarsuccess("", message);
      }
    } else {
      CommonUtility.showSnackbarValidationError(
          AppConstant.INTERNETCCONNECTIONS);
    }

    // Proceed with registration logic
  //  emit(RegisterUserStart());

    // Optionally call the repository to handle registration logic
    // var registrationData = await AuthRepository.registerUser(...);
    // handle registration success/failure here...
  }



  Future<void>checkEmailTick(CheckEmailSuccessMakeTickEvent event,Emitter<CheckEmailState> emit)async{
    if(event.checkEmailPojo.message=="OTP Verified"){
      emit(CheckEmailSuccessMakeTickState(event.checkEmailPojo));
    }
  }


}
