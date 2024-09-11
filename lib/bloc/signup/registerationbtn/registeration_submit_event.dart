part of 'registeration_submit_bloc.dart';

abstract class RegisterationSubmitEvent extends Equatable {
  const RegisterationSubmitEvent();
}

class RegisterationStart extends RegisterationSubmitEvent{
  RegisterationStart();
  @override
  List<Object?> get props => [];

}
