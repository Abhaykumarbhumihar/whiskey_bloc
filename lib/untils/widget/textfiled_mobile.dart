import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utiks.dart';
import '../color_code.dart';
import '../local/app_values.dart';
import '../local/preference.dart';
import '../local/screenUtils.dart';

class CustomTextInputMobile extends StatefulWidget {
  final String title;
  final String rightIcon;
  final bool isPass;
  final bool isSuffix;
  final bool? isFocus;
  final hint;
  final readOnly;
  final onTap;
  final inputFormatters;
  final suffixIcon;
  final isDOllar;
  final keyBoardType;
  final onFieldSubmitted;
  final maxLength;
  final autovalidateMode;
  final validator;
  final onChanged;
  final focusNode;

  final TextEditingController? controller;

  const CustomTextInputMobile({
    required this.title,
    required this.rightIcon,
    required this.isPass,
    required this.isSuffix,
    this.hint,
    this.validator,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.onChanged,
    this.focusNode,
    this.inputFormatters,
    this.isDOllar = false,
    this.isFocus = false,
    this.readOnly,
    this.onTap,
    this.maxLength,
    this.keyBoardType,
    this.suffixIcon,
    this.controller,
  });

  @override
  State<CustomTextInputMobile> createState() => _CustomTextInputMobileState();
}

class _CustomTextInputMobileState extends State<CustomTextInputMobile> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtils.width(context) * 0.015, bottom: 4.0),
          child: Text(
            widget.title,
            style: TextStyle(
                color: PreferenceManger().getTheme() == true
                    ? Colors.white
                    : Colors.black,
                fontFamily: 'Poppins Medium',
                fontSize: ScreenUtils.width(context) * 0.03 - 1),
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextFormField(
              autofocus: widget.isFocus ?? false,
              textCapitalization: TextCapitalization.sentences,
              onChanged: widget.onChanged ?? (val) {},
              cursorColor: appColor,
              autovalidateMode: widget.title == 'Email'
                  ? widget.autovalidateMode
                  : AutovalidateMode.disabled ?? AutovalidateMode.disabled,
              maxLength: widget.maxLength,
              validator: widget.title == 'Email'
                  ? widget.validator
                  : null ??
                      (val) {
                        return null;
                      },
              onFieldSubmitted: widget.onFieldSubmitted,
              keyboardType: widget.keyBoardType,
              onTap: widget.onTap ?? () {},
              focusNode: widget.focusNode,
              inputFormatters: widget.inputFormatters,
              controller: widget.controller ?? TextEditingController(),
              readOnly: widget.readOnly ?? false,
              obscureText: widget.isPass == true ? _obscureText : false,
              decoration: InputDecoration(
                counter: SizedBox(),
                contentPadding: EdgeInsets.only(
                    left: widget.isDOllar == true ? margin_22 : margin_15,
                    top: margin_19,
                    bottom: margin_19,
                    right: margin_19),
                suffixIcon: widget.isSuffix == true
                    ? widget.suffixIcon ??
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: sufixs(context, _obscureText),
                        )
                    : const SizedBox(),
                filled: true,
                fillColor: PreferenceManger().getTheme() == true
                    ? Colors.grey.shade900
                    : Colors.white,
                hintText: widget.hint ?? widget.title,
                hintStyle: TextStyle(
                    color: PreferenceManger().getTheme() == true
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                    fontFamily: 'Poppins Regular',
                    fontSize: ScreenUtils.width(context) * 0.03),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 1,
                      color: PreferenceManger().getTheme() == true
                          ? Color(Utils.hexStringToHexInt('#917C49'))
                          : appColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 1,
                      color: PreferenceManger().getTheme() == true
                          ? Color(Utils.hexStringToHexInt('#917C49'))
                          : appColor),
                ),
              ),
              style: TextStyle(
                  color: PreferenceManger().getTheme() == true
                      ? Colors.white
                      : Colors.black,
                  fontSize: ScreenUtils.width(context) * 0.03,
                  fontFamily: 'Poppins Regular'),
            ),
            widget.isDOllar == false
                ? SizedBox(
                    height: 0,
                    width: 0,
                  )
                : Text(
                    '\$',
                    style: TextStyle(
                        color: PreferenceManger().getTheme() == true
                            ? Colors.white
                            : Colors.black),
                  )
          ],
        ),
      ],
    );
  }

  sufixs(context, _obscureText) {
    if (widget.title == "Password" ||
        widget.title == "Old Password" ||
        widget.title == "New Password" ||
        widget.title == "Confirm Password" ||
        widget.title == "Current Password") {
      return Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Color(Utils.hexStringToHexInt('#DBB874')),
        size: height_15,
      );
    } else if (widget.title == "Email") {
      return Icon(
        Icons.email_outlined,
        color: Color(Utils.hexStringToHexInt('#DBB874')),
        size: height_15,
      );
    } else if (widget.title == "Phone" || widget.title == "Phone number") {
      return Icon(
        Icons.phone,
        color: Color(Utils.hexStringToHexInt('#DBB874')),
        size: height_15,
      );
    } else {
      return Icon(
        CupertinoIcons.person_circle_fill,
        color: Color(Utils.hexStringToHexInt('#DBB874')),
        size: height_15,
      );
    }
  }
}
