part of 'registeration_submit_bloc.dart';

sealed class RegisterationSubmitState extends Equatable {
  const RegisterationSubmitState();
}

final class RegisterationSubmitInitial extends RegisterationSubmitState {
  @override
  List<Object> get props => [];
}


final class RegisterationSubmitLoading extends RegisterationSubmitState {
  @override
  List<Object> get props => [];
}

final class RegisterationSubmitSuccess extends RegisterationSubmitState {
   dynamic data;
   RegisterationSubmitSuccess(this.data);
  @override
  List<Object> get props => [data];
}
final class RegisterationSubmitError extends RegisterationSubmitState {
  dynamic data;
  RegisterationSubmitError(this.data);
  @override
  List<Object> get props => [data];
}