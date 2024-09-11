import 'dart:ui';

import 'package:flutter/material.dart';

import '../../untils/Utiks.dart';
import '../../untils/color_code.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      PreferenceManger().getTheme() == true ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: ScreenUtils.width(context),
          height: ScreenUtils.height(context),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1,
                  sigmaY: 1,
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
                  sigmaX: 1,
                  sigmaY: 1,
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
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Image(
                    image: const AssetImage('assets/images/wlogo.png'),
                    width: ScreenUtils.width(context) * 0.3,
                    height: ScreenUtils.width(context) * 0.3,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: PreferenceManger().getTheme() == false
                            ? Colors.black
                            : Colors.white,
                        fontSize: ScreenUtils.width(context) * 0.06,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins Medium",
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: ScreenUtils.width(context) * 0.8,
                      child: Utils.commonLightedButton(context, "LOG IN",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }),
                    ),
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.04 - 3,
                    ),
                    SizedBox(
                      width: ScreenUtils.width(context) * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                        //  Get.to(RegisterOne());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: PreferenceManger().getTheme() == true
                              ? appColor.withOpacity(0.1)
                              : Color(Utils.hexStringToHexInt('#f5ebdb')),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              width: 2.0,
                              color: Color(Utils.hexStringToHexInt('#DBB874')),

                              //#DBB87440
                            ), // Black border
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: ScreenUtils.width(context) * 0.04,
                            color: PreferenceManger().getTheme() == false
                                ? Colors.black
                                : Colors.white,
                            fontFamily: "Poppins Medium",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.04,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
