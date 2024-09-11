import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/UI/splash/splash_page.dart';
import 'package:whiskey_with_bloc/bloc/signup/country/country_bloc.dart';
import 'package:whiskey_with_bloc/untils/local/SharedPrefs.dart';

import '../../bloc/signup/registerationBloc/registeration_form_bloc.dart';
import '../local/app_values.dart';
import '../local/preference.dart';
import 'commoncomponent.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryBloc, CountryState>(
      listener: (context, state) async {


        if(state.countryPojo.code==500){
         await SharedPrefs.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SplashPage()),
          );
        }

        // Check if city and state data from ZIP code is available and valid
        if (state.cityByZipPojo.data != null) {
          var data = state.cityByZipPojo.data;

          // Dispatch UpdateStateEvent and UpdateCityEvent when data is available
          context.read<RegisterationFormBloc>().add(
              UpdateStateEvent(
                  data?.physicalState.toString() ?? "Unknown State"
              )
          );

          context.read<RegisterationFormBloc>().add(
              UpdateCityEvent(
                  data?.physicalCity.toString() ?? "Unknown City"
              )
          );



            }
      },
      builder: (context, state) {
        var data = state.cityByZipPojo.data;






        return BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {

            return SizedBox(
              height: height_250,
              child: state.isLoading == false
                  ? ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.read<RegisterationFormBloc>().add(
                          UpdateCountryEvent(
                              state.countryPojo.data![index].name ?? ""));
                      context.read<RegisterationFormBloc>().add(
                          UpdatelongitudeEvent(
                              state.countryPojo.data![index].longitude ??
                                  ""));
                      context.read<RegisterationFormBloc>().add(
                          UpdateLatitudeEvent(
                              state.countryPojo.data![index].latitude ?? ""));
                      context.read<RegisterationFormBloc>().add(
                          UpdateisoCodeEvent(
                              state.countryPojo.data![index].isoCode ?? ""));
                      context
                          .read<RegisterationFormBloc>()
                          .add(ToggleCountryListVisibilityEvent(false));
                    },
                    child: textRegular(
                        text: state.countryPojo.data![index].name ?? "",
                        fontSize: font_14,
                        color: PreferenceManger().getTheme() == true
                            ? Colors.white
                            : Colors.black),
                  );
                },
                itemCount: state.countryPojo.data?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: height_15);
                },
              )
                  : Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}
