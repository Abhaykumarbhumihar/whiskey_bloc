part of 'registeration_form_bloc.dart';

sealed class RegisterationFormEvent extends Equatable {
  const RegisterationFormEvent();
}


class RegisterationFormInitialEvent extends RegisterationFormEvent{
  @override

  List<Object?> get props => [];

}




class ToggleCountryListVisibilityEvent extends RegisterationFormEvent {
  bool showhidelist;
  ToggleCountryListVisibilityEvent(this.showhidelist);
  @override
  List<Object?> get props => [showhidelist];
}

class RegisterationFormLoadingEvent extends RegisterationFormEvent{
  @override
  List<Object?> get props => [];
}
class UpdateCountryEvent extends RegisterationFormEvent {
  final String country;
  const UpdateCountryEvent(this.country);

  @override
  List<Object?> get props => [country];
}
class UpdateLatitudeEvent extends RegisterationFormEvent {
  final String latitude;
  const UpdateLatitudeEvent(this.latitude);

  @override
  List<Object?> get props => [latitude];
}
class UpdatelongitudeEvent extends RegisterationFormEvent {
  final String longitude;
  const UpdatelongitudeEvent(this.longitude);

  @override
  List<Object?> get props => [longitude];
}

class UpdateisoCodeEvent extends RegisterationFormEvent {
  final String isoCode;
  const UpdateisoCodeEvent(this.isoCode);

  @override
  List<Object?> get props => [isoCode];
}

class UpdateZipcodeEvent extends RegisterationFormEvent {
  final String zipcode;
  const UpdateZipcodeEvent(this.zipcode);

  @override
  List<Object?> get props => [zipcode];
}

class UpdateStateEvent extends RegisterationFormEvent {
  final String state;
  const UpdateStateEvent(this.state);

  @override
  List<Object?> get props => [state];
}

class UpdateCityEvent extends RegisterationFormEvent {
  final String city;
  const UpdateCityEvent(this.city);

  @override
  List<Object?> get props => [city];
}

class UpdateImageEvent extends RegisterationFormEvent {
  final dynamic image;
  const UpdateImageEvent(this.image);

  @override
  List<Object?> get props => [image];
}

class UpdateImageFileEvent extends RegisterationFormEvent {
  final File image;
  const UpdateImageFileEvent(this.image);

  @override
  List<Object?> get props => [image];
}


class UpdateFirstNameEvent extends RegisterationFormEvent {
  final String firstname;
  const UpdateFirstNameEvent(this.firstname);

  @override
  List<Object?> get props => [firstname];
}

class UpdateLastNameEvent extends RegisterationFormEvent {
  final String lastname;
  const UpdateLastNameEvent(this.lastname);

  @override
  List<Object?> get props => [lastname];
}

class UpdateScreenNameEvent extends RegisterationFormEvent {
  final String screenname;
  const UpdateScreenNameEvent(this.screenname);

  @override
  List<Object?> get props => [screenname];
}

class UpdateEmailEvent extends RegisterationFormEvent {
  final String email;
  const UpdateEmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class UpdateDobEvent extends RegisterationFormEvent {
  final String dob;
  const UpdateDobEvent(this.dob);

  @override
  List<Object?> get props => [dob];
}



class UpdateTweeterUrlEvent extends RegisterationFormEvent {
  final String tweeterurl;
  const UpdateTweeterUrlEvent(this.tweeterurl);

  @override
  List<Object?> get props => [tweeterurl];
}

class UpdateFacebookUrlEvent extends RegisterationFormEvent {
  final String facebookurl;
  const UpdateFacebookUrlEvent(this.facebookurl);

  @override
  List<Object?> get props => [facebookurl];
}

class UpdateInstagramUrlEvent extends RegisterationFormEvent {
  final String instagramurl;
  const UpdateInstagramUrlEvent(this.instagramurl);

  @override
  List<Object?> get props => [instagramurl];
}



class RegisterationFormSubmitEvent extends RegisterationFormEvent {
  final String image;
  final String firstname;
  final String lastname;
  final String screenname;
  final String email;
  final String dob;
  final String country;
  final String zipcode;
  final String state;
  final String city;
  final String tweeterurl;
  final String facebookurl;
  final String instagramurl;

  RegisterationFormSubmitEvent({
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.screenname,
    required this.email,
    required this.dob,
    required this.country,
    required this.zipcode,
    required this.state,
    required this.city,
    required this.tweeterurl,
    required this.facebookurl,
    required this.instagramurl,
  });

  @override
  List<Object?> get props => [
    image,
    firstname,
    lastname,
    screenname,
    email,
    dob,
    country,
    zipcode,
    state,
    city,
    tweeterurl,
    facebookurl,
    instagramurl,
  ];
}
