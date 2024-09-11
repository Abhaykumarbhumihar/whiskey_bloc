part of 'registeration_form_bloc.dart';

// abstract class RegisterationFormState extends Equatable {
//   const RegisterationFormState();
// }
//
// final class RegisterationFormInitial extends RegisterationFormState {
//   @override
//   List<Object> get props => [];
// }


class RegisterationFormFieldState extends Equatable {
  final bool countryVisiListshow;
  final String image;
  final String latitude;
  final String longitude;
  final String isoCode;
  final File? imageFile;
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
  final bool loading;

  const RegisterationFormFieldState({
    required this.image,
    required this.countryVisiListshow,
    required this.latitude,
    required this.longitude,
    required this.isoCode,
    required this.firstname,
    required this.loading,
    this.imageFile,
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

  factory RegisterationFormFieldState.initial() {
    return RegisterationFormFieldState(
      loading: false,
      latitude: '',
      countryVisiListshow: false,
      isoCode: '',
      longitude: '',
      image: '',
      imageFile: null,
      firstname: '',
      lastname: '',
      screenname: '',
      email: '',
      dob: '',
      country: '',
      zipcode: '',
      state: '',
      city: '',
      tweeterurl: '',
      facebookurl: '',
      instagramurl: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': image,
    "profile_completed": "1",
      'first_name': firstname,
      'last_name': lastname,
      'user_name': screenname,

      'year_of_birth': dob,
      'country': country,
      'zipcode': zipcode,
      'state': state,
      'city': city,
      'twitter_link': tweeterurl,
      'fb_link': facebookurl,
      'insta_link': instagramurl,
      'country_latitude': latitude,
      'country_longitude': longitude,
      'country_iso_code': isoCode,

    };
  }

  // Implementing the copyWith method
  RegisterationFormFieldState copyWith({
    bool? loading,
    String? image,
    bool? countryVisiListshow,
    String? longitude,
    String? isoCode,
    String? latitude,
    File? imageFile,
    String? firstname,
    String? lastname,
    String? screenname,
    String? email,
    String? dob,
    String? country,
    String? zipcode,
    String? state,
    String? city,
    String? tweeterurl,
    String? facebookurl,
    String? instagramurl,
  }) {
    return RegisterationFormFieldState(
      loading:loading??this.loading,
      image: image ?? this.image,
      countryVisiListshow: countryVisiListshow ?? this.countryVisiListshow,
      isoCode: isoCode ?? this.isoCode,
      longitude: longitude??this.longitude,
      latitude: longitude??this.longitude,
      imageFile: imageFile??this.imageFile,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      screenname: screenname ?? this.screenname,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      state: state ?? this.state,
      city: city ?? this.city,
      tweeterurl: tweeterurl ?? this.tweeterurl,
      facebookurl: facebookurl ?? this.facebookurl,
      instagramurl: instagramurl ?? this.instagramurl,
    );
  }

  @override
  List<Object?> get props => [
    image,
    imageFile,
    firstname,
    lastname,
    countryVisiListshow,
    isoCode,
    latitude,
    longitude,
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
    loading
  ];
}
