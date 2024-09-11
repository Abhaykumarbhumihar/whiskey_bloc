part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();
}

class CountryEventLoading extends CountryEvent{
  @override
  List<Object?> get props => [];
}

class CountryListEvent extends CountryEvent{
  @override
  List<Object?> get props => [];
}

class CityByZipEvent extends CountryEvent{
  String zipcode;
  CityByZipEvent(this.zipcode);

  List<Object?> get props => [zipcode];
}