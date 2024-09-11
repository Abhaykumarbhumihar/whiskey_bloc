import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../UI/intropage/auth_repository.dart';
import '../../model/login/LoginPojo.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../untils/validation.dart';
import '../../untils/widget/commonUtility.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<LoginStart>(loginAction);
  }

  Future<void> loginAction(LoginStart event, Emitter<LoginState> emit) async {
    String email = emailController.text;
    String password = passwordController.text;
    String? emailValidationMessage = Validation.validateEmail(email);
    String? passwordValidationMessage = Validation.validatePassword(password);

    if (emailValidationMessage != null) {
      emit(LoginError(emailValidationMessage));
      return;
    }

    if (passwordValidationMessage != null) {
      emit(LoginError(passwordValidationMessage));
      return;
    }

    emit(LoginLoading());
    try {
      dynamic loginData =
          await AuthRepository.login(event.email, event.password);
      var data = json.decode(loginData.body);
    //  print(data);
      if (data['code'] == 200) {
        print(data['data']['email'] ?? "");
        print("===x-csrf-token=======dd=");

        print(data['tokens']['x-csrf-token'] ?? "");
        print("===access=======dd=");

        print(data['tokens']['access']['token'] ?? "");
        print("===profile_completed=======dd=");

        print(data['data']['profile_completed'] ?? 0);
        print("===refresh=======dd=");

        print( data['tokens']['refresh']['token'] ?? "");
        print("==========idd=");

        print( data['data']['_id'] ?? "");
        print("==========dd=");
        print(event.email);
        print( event.password ?? "");
       try{
         await SharedPrefs.setString("bemail", event.email ?? "");
         await SharedPrefs.setString("bpassword", event.password ?? "");
         await SharedPrefs.setString("email", data['data']['email']+"" ?? "");
         await SharedPrefs.setString(
             "xcrftoken", data['tokens']['x-csrf-token']+"" ?? "");
         await SharedPrefs.setString(
             "accesstoken", data['tokens']['access']['token'] +""?? "");
         await SharedPrefs.setString(
             "refreshToken", data['tokens']['refresh']['token']+"" ?? "");

         await SharedPrefs.setString(
             "profilecomplete", data['data']['profile_completed']+"" ?? "0");
         await SharedPrefs.setString('userid', data['data']['_id']+"" ?? "");
       }catch(e){
         print(e);
       }
      //  var loadedData = LoginPojo.fromJson(data);
        emit(LoginSuccess(data));
      }
      {

        emit(LoginError(data['message']));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
