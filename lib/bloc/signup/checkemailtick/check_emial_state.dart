part of 'check_emial_bloc.dart';

abstract class CheckEmialCheckState extends Equatable{}

 class CheckEmialInitial extends CheckEmialCheckState {
  @override

  List<Object?> get props => [];
}

class CheckEmailTickStartState extends CheckEmialCheckState{
  bool emailCheck;
  CheckEmailTickStartState(this.emailCheck);
  @override
  List<Object?> get props => [emailCheck];
}


