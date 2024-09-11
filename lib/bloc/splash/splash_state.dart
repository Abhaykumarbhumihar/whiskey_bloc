part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {}

final class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}


class SplashLoading extends SplashState{
  @override
  List<Object?> get props => [];
}


class SplashLoaded extends SplashState{

  SplashPojo splashPojo;
  SplashLoaded(this.splashPojo);

  @override
  List<Object?> get props =>[splashPojo];
}


class SplashErrorLoaded extends SplashState{
  String message;
  String code;
  SplashErrorLoaded(this.message,this.code);

  @override
  List<Object?> get props =>[message,code];
}

class SplashNavigateToHome extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashNavigateToLogin extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashNavigateToCompleteProfile extends SplashState {
  @override
  List<Object?> get props => [];
}