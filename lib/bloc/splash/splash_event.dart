part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable{

}


class FetchSplashEvent extends SplashEvent{
  String type;

  FetchSplashEvent(this.type);
  @override
  List<Object?> get props =>[type];

}
class StartTimerEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}