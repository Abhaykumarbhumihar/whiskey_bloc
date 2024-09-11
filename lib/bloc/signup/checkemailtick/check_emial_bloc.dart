import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'check_emial_event.dart';
part 'check_emial_state.dart';

class CheckEmailTickBloc extends Bloc<CheckEmialCheckEvent, CheckEmialCheckState> {
  CheckEmailTickBloc() : super(CheckEmialInitial()) {
    on<CheckEmialEventTickStart>(isEmailCheck);
  }


  Future<void>isEmailCheck(CheckEmialEventTickStart event,Emitter<CheckEmialCheckState>emit)async{
    emit(CheckEmailTickStartState(event.isEmailCheck));
  }
}
