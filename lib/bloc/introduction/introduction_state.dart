part of 'introduction_bloc.dart';

sealed class IntroductionState extends Equatable {
  const IntroductionState();
}

final class IntroductionInitial extends IntroductionState {
  @override
  List<Object> get props => [];
}

class IntroductionLoading extends IntroductionState {
  @override
  List<Object> get props => [];
}

class IntroductionSuccess extends IntroductionState {
  IntroductinPojo introductinPojo;
  IntroductionSuccess(this.introductinPojo);

  @override
  List<Object> get props => [introductinPojo];
}


class IntroductionError extends IntroductionState{
  String message;
  IntroductionError(this.message);
  @override
  List<Object?> get props => [message];
}