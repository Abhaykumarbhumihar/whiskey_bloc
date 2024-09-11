part of 'check_emial_bloc.dart';


abstract class CheckEmialCheckEvent extends Equatable{}

final class CheckEmialEventInitial extends CheckEmialCheckEvent {
  @override

  List<Object?> get props => [];
}

final class CheckEmialEventTickStart extends CheckEmialCheckEvent {
  bool isEmailCheck;
  CheckEmialEventTickStart(this.isEmailCheck);
  @override

  List<Object?> get props => [isEmailCheck];
}