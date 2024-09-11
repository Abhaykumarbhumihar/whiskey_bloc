part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginStart extends LoginEvent{
  String email;
  String password;
  LoginStart(this.email,this.password);
  @override
  List<Object?> get props => [email,password];

}


