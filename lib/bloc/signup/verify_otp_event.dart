part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class VerifyOtpStartEvent extends VerifyOtpEvent{
  String otp;
  String email;
  VerifyOtpStartEvent(this.otp,this.email);

  @override
  List<Object?> get props => [otp,email];
}
class VerifyOtpResendEmailEvent extends VerifyOtpEvent{
  String email;
  VerifyOtpResendEmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}


// Event to start the timer
class StartTimerEvent extends VerifyOtpEvent {
  @override
  List<Object?> get props => [];
}

// Event for each tick of the timer (every second)
class TimerTickEvent extends VerifyOtpEvent {
  final int remainingSeconds;

  TimerTickEvent(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}

// Event to reset the timer
class ResetTimerEvent extends VerifyOtpEvent {
  @override
  List<Object?> get props => [];
}