part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();
}

final class VerifyOtpInitial extends VerifyOtpState {
  @override
  List<Object> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState{
  @override
  List<Object?> get props => [];
}

class VerifyOtpSuccess extends VerifyOtpState{
  CheckEmailPojo otpverifyPojo;
  VerifyOtpSuccess(this.otpverifyPojo);

  @override
  List<Object?> get props => [otpverifyPojo];
}


class VerifyOtpResendEmail extends VerifyOtpState{
  CheckEmailPojo email ;
  VerifyOtpResendEmail(this.email);

  @override
  List<Object?> get props => [email];
}


class VerifyOtpError extends VerifyOtpState{
  CheckEmailPojo otpverifyPojo;
  VerifyOtpError(this.otpverifyPojo);

  @override
  List<Object?> get props => [otpverifyPojo];
}

// State to represent each tick of the timer
class CheckEmailTimerTick extends VerifyOtpState {
  final int remainingSeconds;
  final bool isResendEnabled;

  CheckEmailTimerTick(this.remainingSeconds, this.isResendEnabled);

  @override
  List<Object?> get props => [remainingSeconds, isResendEnabled];
}

// State to represent when the timer has reset
class CheckEmailTimerReset extends VerifyOtpState {
  @override
  List<Object?> get props => [];
}