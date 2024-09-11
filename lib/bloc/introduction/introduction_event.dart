part of 'introduction_bloc.dart';

abstract class IntroductionEvent extends Equatable {
  const IntroductionEvent();
}

class FetchIntroductionEvent extends IntroductionEvent{
  String type;

  FetchIntroductionEvent(this.type);
  @override
  List<Object?> get props =>[type];

}
