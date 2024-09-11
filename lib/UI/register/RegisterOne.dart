import 'package:flutter/material.dart';

import '../../untils/Utiks.dart';
import '../../untils/color_code.dart';
import '../../untils/local/app_values.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/socail_button.dart';


class RegisterOne extends StatelessWidget {
  RegisterOne({super.key});



  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(Utils.hexStringToHexInt('#DBB874'));

     return Scaffold(
      body: Container(
        width: ScreenUtils.width(context),
        height: ScreenUtils.height(context),
        decoration: PreferenceManger().getTheme() == true ? blackd : whited,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Column(
                children: <Widget>[
                  Utils.commonLogo(context),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.02,
                  ),
                  Utils.commonSemiboldHeading(context, "Registration"),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.01,
                  ),
                  Utils.commonLighttitle(context,
                      'Please select one of the options below to create your WhiskeyTrove account'),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.01,
                  ),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.04,
                  ),
                  if (Theme.of(context).platform == TargetPlatform.iOS)
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: margin_60),
                      child: InkWell(
                        onTap: () {
                          //controller.signInWithApple(context);
                        },
                        child: SocialButton(
                            isApple: true,
                            imagePath: PreferenceManger().getTheme() ==
                                false
                                ? "assets/images/appledark.png"
                                : 'assets/images/buttonbackground/appleicom.png')

                      ),
                    ),
                  SizedBox(height: height_15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            //controller.signInWithGoogle(context);
                          },
                          child: SocialButton(
                              isApple: false,
                              imagePath: 'assets/images/google.png')),
                      SizedBox(width: width_15),
                      InkWell(
                          onTap: () {
                            //controller.signInWithFacebook(context);
                          },
                          child: SocialButton(
                              isApple: false,
                              imagePath: 'assets/images/facebook.png')),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 2,
                          color: primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 12, //   textAlign: TextAlign.center,
                              color: PreferenceManger().getTheme() == false
                                  ? Colors.black
                                  : Colors.white,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 2,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //Get.to(SignUp());
                    },
                    child: Container(
                      padding: EdgeInsets.all(margin_10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                              colors: [appColor, Color(0xffFFE9BE)])),
                      child: Text(
                        'CREATE A NEW ACCOUNT',
                        style: TextStyle(
                          fontSize: ScreenUtils.width(context) * 0.03 + 3,
                          color: Colors.black,
                          fontFamily: "Poppins Medium",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.01,
                  ),
                  GestureDetector(
                      onTap: () {
                       // Get.to(Login());
                      },
                      child: Utils.richText(
                          context, "Already have an account?", "Sign In")),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              child: Container(
                  width: ScreenUtils.width(context),
                  child: Utils.commonPrivacyTermsText(context, policytap: () {
                 //   Get.to(PrivacyPolicy());
                  }, termstap: () {
                 //   Get.to(TermsCondition());
                  })),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration blackd = BoxDecoration(
    color: Colors.black,
    image: DecorationImage(
        image: AssetImage(
          PreferenceManger().getTheme() == true
              ? 'assets/images/darkthemeimage/xcxcx.png'
              : 'assets/images/backImage.png',
        ),
        fit: BoxFit.cover,
        opacity: PreferenceManger().getTheme() == true ? 0.5 : 0.0),
  );

  BoxDecoration whited = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        PreferenceManger().getTheme() == true
            ? 'assets/images/darkthemeimage/xcxcx.png'
            : 'assets/images/backImage.png',
      ),
      fit: BoxFit.cover,
    ),
  );
}