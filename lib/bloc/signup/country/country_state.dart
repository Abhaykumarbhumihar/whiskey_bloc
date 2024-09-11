part of 'country_bloc.dart';

class CountryState extends Equatable {
  final CountryPojo countryPojo;
  final CityByZipPojo cityByZipPojo;
  final bool isLoading;
  final String message;
  const CountryState(
  {required this.cityByZipPojo,required this.countryPojo,required this.isLoading,required this.message}
      );

  factory CountryState.initial(){
    return CountryState(
      cityByZipPojo: CityByZipPojo(),
      countryPojo: CountryPojo(),
      isLoading: false,
      message: ''
    );
  }

  CountryState copyWith({
    CountryPojo? countryPojo,
    CityByZipPojo? cityByZipPojo,
    bool? isLoading,
    String? message
}){
    return CountryState(
        cityByZipPojo: cityByZipPojo??this.cityByZipPojo,
      countryPojo:countryPojo??this.countryPojo ,
      isLoading: isLoading??this.isLoading,
      message: message??this.message
    );
  }
  @override
  List<Object?> get props => [cityByZipPojo,countryPojo,isLoading,message];
}

