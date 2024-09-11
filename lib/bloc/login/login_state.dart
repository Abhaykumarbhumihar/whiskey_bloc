part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState{
  dynamic loginPojo;
  LoginSuccess(this.loginPojo);
  @override
  List<Object?> get props => [loginPojo];
}

class LoginError extends LoginState{
  String message;
  LoginError(this.message);
  @override
  List<Object?> get props => [message];
}