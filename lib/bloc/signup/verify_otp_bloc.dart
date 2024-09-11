import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:whiskey_with_bloc/model/signup/check_email.dart';
import 'package:whiskey_with_bloc/webfile/appConstant.dart';

import '../../UI/intropage/auth_repository.dart';
import '../../untils/widget/commonUtility.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  Timer? timer;
  int remainingSeconds = 30;
  bool isResendEnabled = true;
  String otp = "";
  TextEditingController otpController = TextEditingController();

  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<StartTimerEvent>(_startTimer);
    on<TimerTickEvent>(_onTick);
    on<ResetTimerEvent>(_resetTimer);
    on<VerifyOtpResendEmailEvent>(resendEmail);
    on<VerifyOtpStartEvent>(verifyOtp);
  }

  Future<void> verifyOtp(VerifyOtpStartEvent event,Emitter<VerifyOtpState>emitter) async {
    if (await CommonUtility.isInternetConnected()) {
print(otpController.text);
      String email =  event.email;
      var otpfield = event.otp;
      if (otpfield.isEmpty || otpfield.length > 4) {
        emit(VerifyOtpError(CheckEmailPojo(code: 101,message: "Please enter 4 digit OTP")));
        return;
      }
      var url = AppConstant.VERIFYOTP;
      emit(VerifyOtpLoading());
      dynamic verifyOtpData =
      await AuthRepository.verifyOtp(email, otpfield, url);
      var data = json.decode(verifyOtpData.body);
      print(data);

      var code = data['code'];
      var message = data['message'] ?? "";

      if (code == 200) {
        timer!.cancel();


        emit(VerifyOtpSuccess(CheckEmailPojo(code: 200,message: message)));
      } else {
        print("SDF SDF DSF DSF DSF ");
        emit(VerifyOtpError(CheckEmailPojo(code: 404,message: message)));
      }
    } else {
      
      emit(VerifyOtpError(CheckEmailPojo(code: 101,message: AppConstant.INTERNETCCONNECTIONS)));

    }
  }

  Future<void> resendEmail(
      VerifyOtpResendEmailEvent event, Emitter<VerifyOtpState> emit) async {
    if (await CommonUtility.isInternetConnected()) {
      emit(VerifyOtpLoading());

      dynamic verifyEmailData = await AuthRepository.verifyEmail(event.email);
      var data = json.decode(verifyEmailData.body);
      var code = data['code'];
      var message = data['message'];

      if (code == 200) {
        // Start the timer after successful resend
        add(StartTimerEvent());

        emit(VerifyOtpResendEmail(CheckEmailPojo.fromJson(data)));
      } else {
        emit(VerifyOtpError(CheckEmailPojo(code: 101, message: message)));
      }
    } else {
      emit(VerifyOtpError(CheckEmailPojo(
          code: 101, message: AppConstant.INTERNETCCONNECTIONS)));
    }
  }



  void _startTimer(StartTimerEvent event, Emitter<VerifyOtpState> emit) async {
    isResendEnabled = false; // Disable resend button initially
    remainingSeconds = 30;   // Reset the timer to 10 seconds

    timer?.cancel();         // Cancel any existing timer

    // Emit the initial tick state
    emit(CheckEmailTimerTick(remainingSeconds, isResendEnabled));

    // Start a new timer that runs every second
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;

        // Ensure the state is emitted for every second
        add(TimerTickEvent(remainingSeconds));
      } else {
        timer.cancel();      // Stop the timer when seconds reach 0
        isResendEnabled = true;  // Enable resend after timer ends

        // Notify UI that timer has reset
        add(ResetTimerEvent());
      }
    });
  }



// Emit the updated state on each tick of the timer
  void _onTick(TimerTickEvent event, Emitter<VerifyOtpState> emit) async {
    emit(CheckEmailTimerTick(event.remainingSeconds, isResendEnabled));
  }

// Reset the timer when it reaches 0 and allow resending OTP
  void _resetTimer(ResetTimerEvent event, Emitter<VerifyOtpState> emit) async {
    remainingSeconds = 0; // Reset the remaining seconds
    isResendEnabled = true; // Enable resend

    emit(CheckEmailTimerReset()); // Emit the reset state
  }




  @override
  Future<void> close() {
    timer?.cancel();
    otpController.dispose();
    return super.close();
  }
}
