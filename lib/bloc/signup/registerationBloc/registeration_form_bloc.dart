import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:whiskey_with_bloc/untils/local/SharedPrefs.dart';

part 'registeration_form_event.dart';

part 'registeration_form_state.dart';

class RegisterationFormBloc
    extends Bloc<RegisterationFormEvent, RegisterationFormFieldState> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController screenNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController twitterController =
      TextEditingController(text: 'https://twitter.com/');
  final TextEditingController facebookController =
      TextEditingController(text: 'https://www.facebook.com/');
  final TextEditingController instagramController =
      TextEditingController(text: 'https://www.instagram.com/');
  bool countryVisiList = false;

  RegisterationFormBloc() : super(RegisterationFormFieldState.initial()) {
    on<UpdateImageFileEvent>(imageSelect);
    on<UpdateImageEvent>(imageSelectUpdate);
    on<UpdateCountryEvent>(updateCountry);
    on<UpdateStateEvent>(updateState);
    on<UpdateCityEvent>(updateCity);
    on<UpdateLatitudeEvent>(updateLat);
    on<UpdatelongitudeEvent>(updateLong);
    on<UpdateisoCodeEvent>(updateIso);
    on<UpdateDobEvent>(updateDob);
    on<ToggleCountryListVisibilityEvent>(showHideCountryList);
    on<UpdateFirstNameEvent>(updateFirstName);
    on<UpdateLastNameEvent>(updateLastName);
    on<UpdateScreenNameEvent>(updateScreenName);
    on<UpdateEmailEvent>(updateEmail);

    on<UpdateTweeterUrlEvent>(updatetwitter);
    on<UpdateFacebookUrlEvent>(updatefacebook);
    on<UpdateInstagramUrlEvent>(updateInstagra);
    on<UpdateZipcodeEvent>(updateZip);
    on<RegisterationFormLoadingEvent>(loading);
    on<RegisterationFormInitialEvent>(initiall);
  }

  Future<void>loading(RegisterationFormLoadingEvent event,Emitter<RegisterationFormFieldState>emit)async{
    emit(state.copyWith(loading: true));
  }

  Future<void>initiall(RegisterationFormInitialEvent event,Emitter<RegisterationFormFieldState>emit)async{
    emit(state.copyWith(loading: false));
  }

  Future<void> updatetwitter(UpdateTweeterUrlEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    twitterController.text = event.tweeterurl;
    emit(currentState.copyWith(tweeterurl: event.tweeterurl));
  }

  Future<void> updatefacebook(UpdateFacebookUrlEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    facebookController.text = event.facebookurl;
    emit(currentState.copyWith(facebookurl: event.facebookurl));
  }

  Future<void> updateInstagra(UpdateInstagramUrlEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    instagramController.text = event.instagramurl;
    emit(currentState.copyWith(instagramurl: event.instagramurl));
  }

  Future<void> updateFirstName(UpdateFirstNameEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    firstNameController.text = event.firstname;
    emit(currentState.copyWith(firstname: event.firstname));
  }

  Future<void> updateLastName(UpdateLastNameEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    lastNameController.text = event.lastname;
    emit(currentState.copyWith(lastname: event.lastname));
  }

  Future<void> updateScreenName(UpdateScreenNameEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    screenNameController.text = event.screenname;
    emit(currentState.copyWith(screenname: event.screenname));
  }

  Future<void> updateEmail(
      UpdateEmailEvent event, Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    var email = SharedPrefs.getString("email");
    emailController.text = email;
    emit(currentState.copyWith(email: email));
  }

  Future<void> showHideCountryList(ToggleCountryListVisibilityEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    emit(state.copyWith(countryVisiListshow: event.showhidelist));
  }

  Future<void> imageSelect(UpdateImageFileEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    print(event.image);
    print("CODE IS RUNNING HERE ");
    print("CODE IS  RegisterationFormFieldState RUNNING HERE ${event.image} ");
    final currentState = state as RegisterationFormFieldState;
    emit(currentState.copyWith(imageFile: event.image));
    print("CODE IS  sdsdsssssss RUNNING HERE ");
  }

  Future<void> imageSelectUpdate(
      UpdateImageEvent event, Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    emit(currentState.copyWith(image: event.image));
  }

  Future<void> updateDob(
      UpdateDobEvent event, Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    birthYearController.text = event.dob;
    emit(currentState.copyWith(dob: event.dob));
  }

  Future<void> updateZip(UpdateZipcodeEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    zipCodeController.text = event.zipcode;

    emit(currentState.copyWith(zipcode: event.zipcode));
  }

  Future<void> updateCountry(UpdateCountryEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    countryController.text = event.country;
    emit(currentState.copyWith(country: event.country));
  }

  Future<void> updateState(
      UpdateStateEvent event, Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    stateController.text = event.state;
    emit(currentState.copyWith(state: event.state));
  }

  Future<void> updateCity(
      UpdateCityEvent event, Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    print("SDF SDF DSF DSF DSF ");
    cityController.text = event.city;
    emit(currentState.copyWith(city: event.city));
  }

  Future<void> updateLat(UpdateLatitudeEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    emit(currentState.copyWith(latitude: event.latitude));
  }

  Future<void> updateLong(UpdatelongitudeEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    emit(currentState.copyWith(longitude: event.longitude));
  }

  Future<void> updateIso(UpdateisoCodeEvent event,
      Emitter<RegisterationFormFieldState> emit) async {
    final currentState = state as RegisterationFormFieldState;
    emit(currentState.copyWith(isoCode: event.isoCode));
  }
}
