import 'dart:ui';

import 'package:flutter/material.dart';

import '../local/preference.dart';
import '../local/screenUtils.dart';

class CameraGalleryDialogMobile extends StatelessWidget {
  final title;

  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  CameraGalleryDialogMobile(
      this.onCameraTap,
      this.onGalleryTap,
      this.title,
      );

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4.0,
        sigmaY: 4.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [

            BoxShadow(
              color: PreferenceManger().getTheme() == false
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.54),
              offset: const Offset(
                0.54,
                0.54,
              ),
              blurRadius: 100.0,
              spreadRadius: 10.0,
            ), //BoxShadow
            BoxShadow(
              color: PreferenceManger().getTheme() == false
                  ? Colors.white.withOpacity(0.54)
                  : Colors.black.withOpacity(0.68),
              offset: const Offset(0.54, 0.54),
              blurRadius: 100.0,
              spreadRadius: 10.0,
            ), //BoxShadow
          ],
        ),
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          elevation: 10.0,
          shadowColor: PreferenceManger().getTheme() == false
              ? Colors.white.withOpacity(0.5)
              : Colors.black.withOpacity(0.5),
          backgroundColor: PreferenceManger().getTheme() == false
              ? Colors.white
              : Color(0xff171717),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 4.0, bottom: 10.0),
            child: Container(
              //   padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 16.0,bottom: 16.0),
              padding: EdgeInsets.zero,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 2.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Image(
                            image: const AssetImage(
                                'assets/images/lightthemeimage/cross.png'),
                            width: ScreenUtils.width(context) * 0.05,
                            height: ScreenUtils.width(context) * 0.05,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtils.width(context) * 0.05,
                        fontWeight: FontWeight.bold,
                        color: PreferenceManger().getTheme() == false
                            ? Colors.black
                            : Colors.white,
                        fontFamily: 'Poppins Medium'),
                  ),
                  const SizedBox(height: 4.0),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtils.width(context) * 0.1,
                      right: ScreenUtils.width(context) * 0.1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              onCameraTap();
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              width: ScreenUtils.width(context) * 0.2,
                              height: ScreenUtils.height(context) * 0.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(PreferenceManger()
                                          .getTheme() ==
                                          true
                                          ? "assets/images/buttonbackground/dottedborder.png"
                                          : 'assets/images/addImageCard.png'),
                                      fit: BoxFit.contain),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/darkthemeimage/cameraimage.png'),
                                      width: ScreenUtils.width(context) * 0.05,
                                      height: ScreenUtils.width(context) * 0.05,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              onGalleryTap();
                              Navigator.of(context, rootNavigator: true).pop();

                            },
                            child: Container(
                              padding: const EdgeInsets.all(0.0),
                              width: ScreenUtils.width(context) * 0.2,
                              height: ScreenUtils.height(context) * 0.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(PreferenceManger()
                                          .getTheme() ==
                                          true
                                          ? "assets/images/buttonbackground/dottedborder.png"
                                          : 'assets/images/addImageCard.png'),
                                      fit: BoxFit.contain),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/buttonbackground/duppmyprofileimage.png'),
                                    width: ScreenUtils.width(context) * 0.05,
                                    height: ScreenUtils.width(context) * 0.05,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}