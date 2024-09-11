import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whiskey_with_bloc/UI/splash/splash_page.dart';
import 'package:whiskey_with_bloc/bloc/introduction/introduction_bloc.dart';
import 'package:whiskey_with_bloc/bloc/login/login_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/checkemail/check_email_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/checkuserage/check_user_age_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/country/country_bloc.dart';
import 'package:whiskey_with_bloc/bloc/splash/splash_bloc.dart';

import 'bloc/signup/checkemailtick/check_emial_bloc.dart';
import 'bloc/signup/registerationBloc/imageuploadin/profile_image_bloc.dart';
import 'bloc/signup/registerationBloc/registeration_form_bloc.dart';
import 'bloc/signup/registerationbtn/registeration_submit_bloc.dart';
import 'bloc/signup/verify_otp_bloc.dart';
import 'untils/local/SharedPrefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
        ),
        child: GestureDetector(
          onTap: () {
            /*todo---for close keyboard on tap of outside of screen*/
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: ScreenUtilInit(
            useInheritedMediaQuery: true,
            builder: (context, widget) {
              return MultiBlocProvider(
                  providers: [
                    BlocProvider<SplashBloc>(
                        create: (context) =>
                            SplashBloc()..add(FetchSplashEvent("splash"))),
                    BlocProvider<IntroductionBloc>(
                        create: (context) => IntroductionBloc()
                          ..add(FetchIntroductionEvent("intro"))),
                    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
                    BlocProvider<VerifyOtpBloc>(
                        create: (context) => VerifyOtpBloc()),
                    BlocProvider<CheckUserAgeBloc>(
                        create: (context) => CheckUserAgeBloc()),
                    BlocProvider<CheckEmailTickBloc>(
                        create: (context) => CheckEmailTickBloc()),
                    BlocProvider<RegisterationFormBloc>(
                        create: (context) => RegisterationFormBloc()),
                    BlocProvider<ProfileImageBloc>(
                        create: (context) => ProfileImageBloc()),
                    BlocProvider<CountryBloc>(create: (context) {
                      final verifyOtpBloc =
                          BlocProvider.of<RegisterationFormBloc>(context);
                      return CountryBloc(verifyOtpBloc)
                        ..add(CountryListEvent());
                    }),

                    BlocProvider<RegisterationSubmitBloc>(create: (context) {
                      final registerationBloc =
                      BlocProvider.of<RegisterationFormBloc>(context);
                      return RegisterationSubmitBloc(registerationBloc);
                    }),
                    BlocProvider<CheckEmailBloc>(create: (context) {
                      final verifyOtpBloc =
                          BlocProvider.of<VerifyOtpBloc>(context);
                      return CheckEmailBloc(verifyOtpBloc);
                    }),
                  ],
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: SplashPage(),
                  ));
            },
          ),
        ));
  }
}
