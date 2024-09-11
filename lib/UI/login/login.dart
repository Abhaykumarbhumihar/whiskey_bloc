import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/UI/register/RegisterationForm.dart';
import 'package:whiskey_with_bloc/bloc/login/login_bloc.dart';

import '../../untils/Utiks.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../untils/local/app_values.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/commonUtility.dart';
import '../../untils/widget/socail_button.dart';
import '../../untils/widget/textfiled_mobile.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Widget build(BuildContext context) {
    final Color primaryColor = Color(Utils.hexStringToHexInt('#DBB874'));
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          print(SharedPrefs.getString("email"));
          print("SDF SDF DSF DF DSF DSF $state ");


        } else if (state is LoginSuccess) {
       //   print("CHECK HERE PROFILE COMPLETE DATA ${SharedPrefs.getString("profilecomplete")}");
          if (SharedPrefs.getString("profilecomplete") != "1") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterationFormMobile()),
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: ScreenUtils.width(context),
            height: ScreenUtils.height(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wlogo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.black, Color(0xFFDBB874)],
                  begin: Alignment(0, 0.7),
                  end: Alignment(1, 0),
                ),
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Image.asset(
                      'assets/images/splashimage.png',
                      fit: BoxFit.fill,
                      width: ScreenUtils.width(context),
                      height: ScreenUtils.height(context),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Image.asset(
                      PreferenceManger().getTheme() == true
                          ? 'assets/images/darkthemeimage/background.png'
                          : 'assets/images/lightthemeimage/background.png',
                      fit: BoxFit.fill,
                      width: ScreenUtils.width(context),
                      height: ScreenUtils.height(context),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: width,
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Image(
                              image:
                                  const AssetImage('assets/images/wlogo.png'),
                              width: ScreenUtils.width(context) * 0.3,
                              height: ScreenUtils.width(context) * 0.3,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 22,
                              color: PreferenceManger().getTheme() == false
                                  ? Colors.black
                                  : Colors.white,
                              fontFamily: 'Poppins SemiBold',
                              //marginTop: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtils.width(context) * 0.06,
                                right: ScreenUtils.width(context) * 0.06,
                                top: 6.0),
                            child: Utils.commonLighttitle(context,
                                'Please enter your email address & password to login to your account'),
                          ),
                          SizedBox(
                            height: ScreenUtils.height(context) * 0.03,
                          ),
                          CustomTextInputMobile(
                            title: 'Email',
                            rightIcon: 'assets/images/facebook.png',
                            isPass: false,
                            isSuffix: true,
                            controller:
                                context.read<LoginBloc>().emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              // return EmailValidator.validateEmail(val);
                            },
                          ),
                          SizedBox(
                            height: ScreenUtils.height(context) * 0.02,
                          ),
                          CustomTextInputMobile(
                            title: 'Password',
                            rightIcon: 'assets/images/facebook.png',
                            isPass: true,
                            isSuffix: true,
                            controller:
                                context.read<LoginBloc>().passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    right: ScreenUtils.width(context) * 0.02),
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(ForGotPassword());
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Poppins Medium",
                                      color:
                                          PreferenceManger().getTheme() == true
                                              ? Color(Utils.hexStringToHexInt(
                                                  '#DBB874'))
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtils.height(context) * 0.08,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtils.width(context) * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: ScreenUtils.width(context) * 0.6,
                                  child: Utils.commonLightedButton(
                                      context, "LOG IN", onTap: () {
                                    final email = context
                                        .read<LoginBloc>()
                                        .emailController
                                        .text;
                                    final password = context
                                        .read<LoginBloc>()
                                        .passwordController
                                        .text;

                                    // Dispatch the LoginStart event with email and password
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginStart(email, password));
                                  }),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // SharedPrefs.setBool("isBiometricEnable", value);
                                    // var isEnable = SharedPrefs.getBool(
                                    //     "isBiometricEnable");
                                    // if (isEnable) {
                                    //   controller
                                    //       .authenticaticatBiometric();
                                    // } else {
                                    //   CommonUtility
                                    //       .showSnackbarValidationError(
                                    //       "You need to enable biometric authentication");
                                    // }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(margin_7),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/darkthemeimage/faceloginback.png',
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/faceicon.png',
                                        width:
                                            ScreenUtils.width(context) * 0.1 -
                                                3,
                                        height:
                                            ScreenUtils.width(context) * 0.1 -
                                                3,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtils.height(context) * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtils.width(context) * 0.03,
                                top: ScreenUtils.height(context) * 0.01),
                            child: RichText(
                              textScaleFactor: 1.2,
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "Don't have an account?",
                                      style: TextStyle(
                                          color:
                                              PreferenceManger().getTheme() ==
                                                      false
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontFamily: "Poppins Regular",
                                          fontSize: ScreenUtils.width(context) *
                                                  0.02 +
                                              2)),
                                  TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      fontFamily: "Poppins Regular",
                                      fontSize:
                                          ScreenUtils.width(context) * 0.02 + 2,
                                      color: Color(
                                          Utils.hexStringToHexInt('#DBB874')),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Get.to(RegisterOne())
                                      },
                                  ),
                                  const TextSpan(text: ''),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtils.height(context) * 0.04,
                                bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: primaryColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Or sign in with',
                                    style: TextStyle(
                                      fontSize:
                                          12, //   textAlign: TextAlign.center,
                                      color:
                                          PreferenceManger().getTheme() == false
                                              ? Colors.black
                                              : Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (Theme.of(context).platform == TargetPlatform.iOS)
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: margin_60),
                              child: InkWell(
                                onTap: () {
                                  //controller.signInWithApple(context);
                                },
                                child: SocialButton(
                                    isApple: true,
                                    imagePath: PreferenceManger().getTheme() ==
                                            false
                                        ? "assets/images/appledark.png"
                                        : 'assets/images/buttonbackground/appleicom.png'),
                              ),
                            ),
                          SizedBox(height: height_15),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    //  controller.signInWithGoogle(context);
                                  },
                                  child: SocialButton(
                                      isApple: false,
                                      imagePath: 'assets/images/google.png'),
                                ),
                                SizedBox(width: width_15),
                                InkWell(
                                  onTap: () {
                                    //controller
                                    //    .signInWithFacebook(context);
                                  },
                                  child: SocialButton(
                                      isApple: false,
                                      imagePath: 'assets/images/facebook.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is LoginLoading)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5), // Dark overlay
                        child: Center(
                          child: CircularProgressIndicator(), // Loading spinner
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
