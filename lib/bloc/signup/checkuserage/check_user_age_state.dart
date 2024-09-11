part of 'check_user_age_bloc.dart';

@immutable
sealed class CheckUserAgeState extends Equatable {}


class CheckUserAgeInitial extends CheckUserAgeState {
  @override

  List<Object?> get props => [];
}

class CheckUserAgeTick extends CheckUserAgeState{
bool age =false;
CheckUserAgeTick(this.age);
@override
List<Object?> get props => [age];
}
