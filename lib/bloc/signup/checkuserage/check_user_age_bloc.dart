import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'check_user_age_event.dart';
part 'check_user_age_state.dart';

class CheckUserAgeBloc extends Bloc<CheckUserAgeEvent, CheckUserAgeState> {
  CheckUserAgeBloc() : super(CheckUserAgeInitial()) {

    on<CheckUserAge>(checkUserAge);
  }

  Future<void> checkUserAge(
      CheckUserAge event, Emitter<CheckUserAgeState> emit) async {
    emit(CheckUserAgeTick(event.age));
  }

}
