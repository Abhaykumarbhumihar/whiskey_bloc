import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:whiskey_with_bloc/model/splash/SplashPojo.dart';

import '../../untils/local/SharedPrefs.dart';
import '../../webfile/repositery/splash_repo/splash_intro.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<FetchSplashEvent>(getSplashData);
    on<StartTimerEvent>(startTimer);
  }


  Future<void> getSplashData(
      FetchSplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading()); // Emit loading state

    try {
      var type = event.type ?? "";
      dynamic splashData = await SplashRepository.getSplashData(type);
      var data = json.decode(splashData.body);
      if (data['code'] == 200) {
        var ddata = SplashPojo.fromJson(data);
        SharedPrefs.setString("splashimage", ddata.data?.media ?? "");
        emit(SplashLoaded(ddata));
      } else {
        emit(SplashErrorLoaded(data["message"], ""));
      }

    } catch (e) {
      emit(SplashErrorLoaded(e.toString(), ""));
    }
  }


  Future<void> startTimer(StartTimerEvent event, Emitter<SplashState> emit) async {
    // Start the 5-second timer
    await Future.delayed(const Duration(seconds: 5));

    // Check if the user is logged in
    String? token = SharedPrefs.getString('accesstoken');
    if (token != null && token.isNotEmpty) {
      // User is logged in, navigate to Home Page

      var profilecomplete = SharedPrefs.getInt("profilecomplete");
      if (profilecomplete == "1"){
        emit(SplashNavigateToHome());
      }else{
        emit(SplashNavigateToCompleteProfile());
      }

    } else {
      // User is not logged in, navigate to Login Page
      emit(SplashNavigateToLogin());
    }
  }
}
