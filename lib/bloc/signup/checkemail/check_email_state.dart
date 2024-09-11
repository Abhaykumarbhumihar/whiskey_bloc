part of 'check_email_bloc.dart';

sealed class CheckEmailState extends Equatable {
  const CheckEmailState();
}

final class CheckEmailInitial extends CheckEmailState {
  @override
  List<Object> get props => [];
}


class CheckEmailLoading extends CheckEmailState{
  @override

  List<Object?> get props => [];
}

class CheckEmailStart extends CheckEmailState{
  String email;
  CheckEmailStart(this.email);
  @override
  List<Object?> get props => [email];
}


class CheckEmailSuccess extends CheckEmailState{
  CheckEmailPojo checkEmailPojo;
  CheckEmailSuccess(this.checkEmailPojo);
  @override
  List<Object?> get props => [checkEmailPojo];
}

class CheckEmailError extends CheckEmailState{
  CheckEmailPojo checkEmailPojo;
  CheckEmailError(this.checkEmailPojo);
  @override
  List<Object?> get props => [checkEmailPojo];
}


class CheckEmailSuccessMakeTickState extends CheckEmailState{
  CheckEmailPojo checkEmailPojo;
  CheckEmailSuccessMakeTickState(this.checkEmailPojo);
  @override
  List<Object?> get props => [checkEmailPojo];
}


class RegisterUserSuccess extends CheckEmailState{
  final Map<String,dynamic>data;
  RegisterUserSuccess( this.data);
  @override
  List<Object?> get props => [data];
}

