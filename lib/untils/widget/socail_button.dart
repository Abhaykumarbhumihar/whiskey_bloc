import 'package:flutter/material.dart';

import '../local/app_values.dart';
import '../local/preference.dart';
import '../local/screenUtils.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final bool isApple;

  const SocialButton({required this.imagePath, required this.isApple});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: isApple == false
          ? ScreenUtils.width(context) * 0.27
          : ScreenUtils.width(context),
      decoration: BoxDecoration(
        color: PreferenceManger().getTheme() == true
            ? Colors.grey.shade900
            : Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isApple == true
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 25, width: 25),
              //.paddingOnly(right: margin_10),
          Text('Sign in with Apple',
              style: TextStyle(color: Colors.white, fontSize: font_15)),
        ],
      )
          : Center(
        child: Image.asset(imagePath, height: 25, width: 25),
      ),
    );
  }
}
