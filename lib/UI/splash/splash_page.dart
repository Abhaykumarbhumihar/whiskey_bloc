import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/UI/login/welcome.dart';
import 'package:whiskey_with_bloc/UI/register/RegisterationForm.dart';
import 'package:whiskey_with_bloc/bloc/splash/splash_bloc.dart';
import 'package:whiskey_with_bloc/untils/SnackBarHelper.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/common_shimmer.dart';
import '../../untils/widget/commoncomponent.dart';
import '../../untils/widget/network_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          print(state);
          if (state is SplashInitial || state is SplashLoading) {
            context.read<SplashBloc>().add(StartTimerEvent());
          }else if (state is SplashNavigateToHome) {
           SnackBarHelper.showSnackBar(context, message: "Go on home page");
          } else if (state is SplashNavigateToLogin) {
            SnackBarHelper.showSnackBar(context, message: "Go on login page");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
            );
          }else if(state is SplashNavigateToCompleteProfile){
            SnackBarHelper.showSnackBar(context, message: "Go for complete page");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RegisterationFormMobile()),
            );
          }
        },
        builder: (context, state) {
          return Container(
            decoration: PreferenceManger().getTheme() == true ? blackd : whited,
            // width: ScreenUtils.width(context),
            height: ScreenUtils.height(context),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 1,
                  ),
                  child: state is SplashLoading || state is SplashErrorLoaded
                      ? CommonShimmer(
                          baseColor: Colors.red,
                          child: Container(
                            width: ScreenUtils.width(context),
                            height: ScreenUtils.height(context),
                            child: Image.asset(
                              'assets/images/splashimage.png',
                              fit: BoxFit.fill,
                              width: ScreenUtils.width(context),
                            ),
                          ),
                        )
                      : Center(
                          child: NetworkImageWidget(
                              //https://picsum.photos/250?image=9
                              placeHolder: "",
                              imageUrl:
                                  "${SharedPrefs.getString('splashimage')}",
                              // imageUrl: "https://picsum.photos/250?image=9",
                              imageHeight: ScreenUtils.height(context),
                              imageWidth: ScreenUtils.width(context)),
                        ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: PreferenceManger().getTheme() == true ? 3 : 0,
                    sigmaY: PreferenceManger().getTheme() == true ? 1 : 0,
                  ),
                  child: Image.asset(
                    'assets/images/darkthemeimage/background.png',
                    fit: BoxFit.fill,
                    width: ScreenUtils.width(context),
                    height: ScreenUtils.height(context),
                  ),
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/wlogo.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
