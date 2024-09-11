import 'package:flutter/material.dart';

import '../local/app_values.dart';
import '../local/preference.dart';

Widget textRegular({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins Regular',
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_16,
        fontWeight: FontWeight.w400),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textMedium({text, fontSize, maxLines, textAlign, color, fontWeight}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins Medium',
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_12,
        fontWeight: fontWeight ?? FontWeight.w600),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textMediumItalic({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins MediumItalic',
        fontStyle: FontStyle.italic,
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_10,
        fontWeight: FontWeight.w500),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textItalic({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins Italic',
        fontStyle: FontStyle.italic,
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_11,
        fontWeight: FontWeight.w500),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textSemiBold({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins SemiBold',
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_18,
        fontWeight: FontWeight.w700),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textSemiBoldItalic({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontFamily: 'Poppins SemiBoldItalic',
        color: color ?? Colors.black,
        fontSize: fontSize ?? font_14,
        fontWeight: FontWeight.w700),
    overflow: TextOverflow.ellipsis,
  );
}

Widget textLight({text, fontSize, maxLines, textAlign, color}) {
  return Text(
    text,
    maxLines: maxLines ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
      fontFamily: 'Poppins Light',
      color: color ?? Colors.black,
      fontSize: fontSize ?? font_14,
    ),
    overflow: TextOverflow.ellipsis,
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
