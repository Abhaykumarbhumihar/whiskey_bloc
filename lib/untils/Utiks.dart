import 'package:flutter/material.dart';

import 'color_code.dart';
import 'local/app_values.dart';
import 'local/preference.dart';
import 'local/screenUtils.dart';

class Utils {
  static final String SESSION_ID = "Poppins BlackItalic";
  static List<String> subscribedTopics = [];

  static hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }

  static Widget commonLogo(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Image(
        image: const AssetImage('assets/images/wlogo.png'),
        width: ScreenUtils.width(context) * 0.3,
        height: ScreenUtils.width(context) * 0.3,
      ),
    );
  }

  static Widget commonFaceEnable(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Center(
        child: Image(
          image:
              const AssetImage('assets/images/buttonbackground/faceenable.png'),
          width: ScreenUtils.width(context) * 0.2 - 5,
          height: ScreenUtils.width(context) * 0.2 - 5,
        ),
      ),
    );
  }

  static Widget commonSemiboldHeading(context, text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: PreferenceManger().getTheme() == false
            ? Colors.black
            : Colors.white,
        fontFamily: 'Poppins SemiBold',
        //marginTop: 15,
      ),
    );
  }

  static Widget commonLighttitle(context, text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: PreferenceManger().getTheme() == false
            ? Colors.black
            : Colors.white,
        fontFamily: 'Poppins Light',
        // marginTop: 10,
        // marginBottom: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  // static Widget commonLightedButton(context, text, {onTap}) {
  //   return Container(
  //     // width: ScreenUtils.width(context) * 0.8,
  //     // height: ScreenUtils.height(context) * 0.1 -
  //     //     ScreenUtils.height(context) * 0.03,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8.0),
  //         gradient: LinearGradient(colors: [appColor, Color(0xffFFE9BE)])),
  //     child: ElevatedButton(
  //       onPressed: onTap ?? () {},
  //       style: ElevatedButton.styleFrom(
  //         elevation: 0.0,
  //         primary: Colors.transparent,
  //         shadowColor: Colors.transparent,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.0), // Rounded corners
  //         ),
  //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       ),
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           fontSize: ScreenUtils.width(context) * 0.03 + 3,
  //           color: Colors.black,
  //           fontFamily: "Poppins Medium",
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Widget commonLightedButton(context, text, {onTap}) {
    return Container(
      width: ScreenUtils.width(context),
      // height: ScreenUtils.height(context) * 0.1 -
      //     ScreenUtils.height(context) * 0.03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(colors: [appColor, Color(0xffFFE9BE)])),
      child: ElevatedButton(
        onPressed: onTap ?? () {},
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 + 3,
            color: Colors.black,
            fontFamily: "Poppins Medium",
          ),
        ),
      ),
    );
  }


  static Future<void> unsubscribeFromAllTopics() async {
    try {
      // Unsubscribe from each topic
      await Future.wait(subscribedTopics.map((topic) async {
        print("ALL SUBSCRIVE TOPIC IS $topic");
        // await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
        // print('Unsubscribed from topic: $topic');
      }));

      // Clear the local list of subscribed topics
      //  subscribedTopics.clear();

      print('Successfully unsubscribed from all topics.');
    } catch (error) {
      print('Error unsubscribing from topics: $error');
    }
  }

  static Widget borderButton(context, text, {onTap}) {
    return SizedBox(
      width: ScreenUtils.width(context),
      child: ElevatedButton(
        onPressed: onTap ??
            () {
              // Handle button press
            },
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: PreferenceManger().getTheme() == true
              ? appColor.withOpacity(0.1)
              : Color(Utils.hexStringToHexInt('#f5ebdb')),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              width: 1.0,
              color: Color(Utils.hexStringToHexInt('#DBB874')),
            ), // Black border
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 - 2,
            color: PreferenceManger().getTheme() == false
                ? Colors.black
                : Colors.white,
            fontFamily: "Poppins Medium",
          ),
        ),
      ),
    );
  }

  static String levelCheck({bottle}) {
    if (bottle >= 0 && bottle <= 10) {
      return 'Just Getting Started';
    } else if (bottle >= 11 && bottle <= 30) {
      return 'Enthusiast';
    } else if (bottle >= 31 && bottle <= 50) {
      return 'Connoisseur';
    } else if (bottle >= 51 && bottle <= 70) {
      return 'Aficionado';
    } else if (bottle >= 71 && bottle <= 100) {
      return 'Curator';
    } else if (bottle > 100) {
      return 'Master Collector';
    }
    return '';
  }

  static Widget commonLightedButtonfollowing(context, text, {onTap}) {
    return SizedBox(
      // width:
      //     ScreenUtils.width(context) * 0.3 - ScreenUtils.width(context) * 0.05,
      child: ElevatedButton(
        onPressed: onTap ??
            () {
              // Handle button press
            },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          elevation: 2.0,
          shadowColor: Colors.transparent,
          backgroundColor: Color(Utils.hexStringToHexInt('#DBB874')),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 - 2,
            color: Colors.black,
            fontFamily: "Poppins Regular",
          ),
        ),
      ),
    );
  }

  static Widget borderButtonfollow(context, text, {onTap}) {
    return SizedBox(
      /* width:
          ScreenUtils.width(context) * 0.3 - ScreenUtils.width(context) * 0.06,*/
      child: ElevatedButton(
        onPressed: onTap ?? () {},
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          shadowColor: Colors.transparent,
          backgroundColor: PreferenceManger().getTheme() == true
              ? appColor.withOpacity(0.1)
              : Color(Utils.hexStringToHexInt('#f5ebdb')),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(
              width: 1.0,
              color: Color(Utils.hexStringToHexInt('#DBB874')),
            ), // Black border
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 - 2,
            color: PreferenceManger().getTheme() == false
                ? Colors.black
                : Colors.white,
            fontFamily: "Poppins Regular",
          ),
        ),
      ),
    );
  }



  static Widget appcolorsmallbuttonnewe(context, text, {onTap, bordervalue}) {
    print(bordervalue);
    return SizedBox(
      width:
          ScreenUtils.width(context) * 0.3 - ScreenUtils.width(context) * 0.02,
      child: ElevatedButton(
        onPressed: onTap ??
            () {
              // Handle button press
            },
        style: bordervalue
            ? ElevatedButton.styleFrom(
                elevation: 2.0,
                shadowColor: Colors.transparent,
                backgroundColor: Color(Utils.hexStringToHexInt('#DBB874')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              )
            : ElevatedButton.styleFrom(
                elevation: 2.0,
                shadowColor: Colors.transparent,
                backgroundColor: PreferenceManger().getTheme() == true
                    ? Colors.yellow.withOpacity(0.1)
                    : Color(Utils.hexStringToHexInt('#f5ebdb')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    width: 1.0,
                    color: Color(Utils.hexStringToHexInt('#DBB874')),
                  ), // Black border
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 - 2,
            color: Colors.black,
            fontFamily: "Poppins Regular",
          ),
        ),
      ),
    );
  }

  static Widget appcolorsmallbuttonneweforfliter(context, text,
      {onTap, bordervalue}) {
    print(bordervalue);
    return SizedBox(
      width:
          ScreenUtils.width(context) * 0.3 - ScreenUtils.width(context) * 0.02,
      child: ElevatedButton(
        onPressed: onTap ??
            () {
              // Handle button press
            },
        style: bordervalue
            ? ElevatedButton.styleFrom(
                elevation: 2.0,
                shadowColor: Colors.transparent,
                backgroundColor: Color(Utils.hexStringToHexInt('#DBB874')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0), // Rounded corners
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              )
            : ElevatedButton.styleFrom(
                elevation: 2.0,
                shadowColor: Colors.transparent,
                backgroundColor: PreferenceManger().getTheme() == true
                    ? Colors.yellow.withOpacity(0.1)
                    : Color(Utils.hexStringToHexInt('#f5ebdb')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side: BorderSide(
                    width: 1.0,
                    color: Color(Utils.hexStringToHexInt('#DBB874')),
                  ), // Black border
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtils.width(context) * 0.03 - 2,
            color: PreferenceManger().getTheme() == false
                ? Colors.black
                : Colors.white,
            fontFamily: "Poppins Regular",
          ),
        ),
      ),
    );
  }

  showAndroidDatePicker(BuildContext context, {selectedDate}) async {
    var date = DateTime.now();
    FocusScope.of(context).unfocus();
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData(
              dialogBackgroundColor: Colors.white, // or any other bg color
              colorScheme: const ColorScheme.light(
                background: Colors.white,
                brightness: Brightness.light,
                //primary: AppColors.primaryColor,
                // header background color
                onPrimary: Colors.white,
                // header text color
                onSurface: Colors.black, // body text color
              ),
            ),
            child: child!);
      },
      context: context,
      initialDate: selectedDate,
      // Refer step 1
      firstDate: DateTime(1920, 1, 1),
      lastDate: DateTime(date.year - 19, 12, 31),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }



  static Widget richText(context, nonclicktext, clicktext) {
    return RichText(
      textScaleFactor: 1.2,
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: "$nonclicktext  ",
              style: TextStyle(
                  color: PreferenceManger().getTheme() == false
                      ? Colors.black
                      : Colors.white,
                  fontFamily: "Poppins Light",
                  fontSize: ScreenUtils.width(context) * 0.03 - 2)),
          TextSpan(
            text: '$clicktext',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins Bold",
                fontSize: ScreenUtils.width(context) * 0.03 - 2,
                color: PreferenceManger().getTheme() == false
                    ? Color(Utils.hexStringToHexInt('#DBB874'))
                    : Color(Utils.hexStringToHexInt('#DBB874'))),
          ),
          const TextSpan(text: ''),
        ],
      ),
    );
  }

  static Widget richText1(context, nonclicktext, clicktext) {
    return RichText(
      textScaleFactor: 1.2,
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: "$nonclicktext  ",
              style: TextStyle(
                  color: PreferenceManger().getTheme() == false
                      ? Colors.black
                      : Colors.white,
                  fontFamily: "Poppins Light",
                  fontSize: ScreenUtils.width(context) * 0.02)),
          TextSpan(
            text: '$clicktext',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins Light",
              fontSize: ScreenUtils.width(context) * 0.02,
              color: PreferenceManger().getTheme() == false
                  ? Colors.black54
                  : Colors.grey,
            ),
          ),
          // const TextSpan(text: '.'),
        ],
      ),
    );
  }

  static Widget richTextprice(context, nonclicktext, clicktext) {
    return RichText(
      textScaleFactor: 1.2,
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: "$nonclicktext  ",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins Regular",
                  fontSize: ScreenUtils.width(context) * 0.02)),
          TextSpan(
            text: '$clicktext',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontFamily: "Poppins Regular",
              fontSize: ScreenUtils.width(context) * 0.02,
              color: Color(Utils.hexStringToHexInt('#DBB874')),
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  static Widget commonPrivacyTermsText(context, {termstap, policytap}) {
    return Column(
      children: [
        Text(
          'By creating an account, you agree to our',
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins Light',
            color: PreferenceManger().getTheme() == false
                ? Colors.black
                : Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                termstap();
              },
              child: Text(
                'Terms of Service',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins Bold',
                  color: PreferenceManger().getTheme() == false
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            Text(
              ' and ',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins Regular',
                color: PreferenceManger().getTheme() == false
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                policytap();
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins Bold',
                  color: PreferenceManger().getTheme() == false
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget authAppbar(context, title, {onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap ??
              () {
                Navigator.of(context).pop();
              },
          child: Image(
            image: const AssetImage(
                'assets/images/buttonbackground/arrowwithroundedcontainer.png'),
            // Update with your image path
            height: ScreenUtils.width(context) * 0.09,
            width: ScreenUtils.height(context) * 0.09,
            alignment: Alignment.centerLeft,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: ScreenUtils.width(context) * 0.06),
          child: Text(
            title,
            style: TextStyle(
              fontSize: font_22,
              color: PreferenceManger().getTheme() == false
                  ? Colors.black
                  : Colors.white,
              fontFamily: 'Poppins SemiBold', // Update with your font
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        )
      ],
    );
  }

  static Widget eighteenptMediumText(context, text, size) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == true
              ? Colors.white
              : Colors.black,
          fontSize: size,
          fontFamily: 'Poppins Medium'),
    );
  }

  static Widget sixteenptMediumText(context, text) {
    return Text(
      '$text',
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontSize: ScreenUtils.width(context) * 0.03 + 4,
          fontFamily: 'Poppins Medium'),
    );
  }

  static Widget sisteenptMediumText(context, text) {
    return Text(
      '$text',
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontSize: ScreenUtils.width(context) * 0.03,
          fontFamily: 'Poppins Regular'),
    );
  }

  static Widget registrationMediumText(context, text) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontSize: ScreenUtils.width(context) * 0.04 - 1,
          fontFamily: 'Poppins Medium'),
    );
  }

  static Widget fourteenLightText(context, text) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontSize: ScreenUtils.width(context) * 0.03,
          fontFamily: 'Poppins Light'),
    );
  }

  static Widget tweleveRegular(context, text) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontFamily: 'Poppins Medium',
          fontSize: ScreenUtils.width(context) * 0.03 - 1),
    );
  }

  static Widget sixteenRegular(context, text) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontFamily: 'Poppins Regular',
          fontSize: ScreenUtils.width(context) * 0.04 - 3),
    );
  }

  static Widget twelevLight(context, text) {
    return Text(
      text,
      style: TextStyle(
          color: PreferenceManger().getTheme() == false
              ? Colors.black
              : Colors.white,
          fontFamily: 'Poppins Light',
          fontSize: ScreenUtils.width(context) * 0.03 - 1),
    );
  }

  static Widget fourteenRegular(context, text, textcolor) {
    return Text(
      text,
      style: TextStyle(
          color: textcolor,
          fontFamily: 'Poppins Medium',
          fontSize: ScreenUtils.width(context) * 0.03),
    );
  }
}
