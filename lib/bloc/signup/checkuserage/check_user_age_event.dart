part of 'check_user_age_bloc.dart';

@immutable
sealed class CheckUserAgeEvent extends Equatable {}


class CheckUserAge extends CheckUserAgeEvent{
  bool age=false;
  CheckUserAge(this.age);
  @override
  List<Object?> get props => [age];
}