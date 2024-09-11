part of 'check_email_bloc.dart';

abstract class CheckEmailEvent extends Equatable {
  const CheckEmailEvent();
}

class StartCheckEmailEvent extends CheckEmailEvent{
  String email;
  StartCheckEmailEvent(this.email);
  @override
  List<Object?> get props => [email];

}

class CheckEmailSuccessMakeTickEvent extends CheckEmailEvent{
  CheckEmailPojo checkEmailPojo;
  CheckEmailSuccessMakeTickEvent(this.checkEmailPojo);
  @override
  List<Object?> get props => [checkEmailPojo];
}

class RegisterUserEvent extends CheckEmailEvent{
  final String email;
  final String password;
  final dynamic isEmailVerified;
  final dynamic isAbove21;

  RegisterUserEvent({ required this.isEmailVerified, required this.isAbove21,required this.password,required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email,password,isEmailVerified,isAbove21];
}




