import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whiskey_with_bloc/bloc/signup/checkemail/check_email_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/verify_otp_bloc.dart';
import 'package:whiskey_with_bloc/model/signup/check_email.dart';

import '../../bloc/signup/checkemailtick/check_emial_bloc.dart';
import '../../untils/SnackBarHelper.dart';
import '../../untils/Utiks.dart';
import '../../untils/local/app_values.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/asset_image.dart';
import '../../untils/widget/commonUtility.dart';
import '../../untils/widget/commoncomponent.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        print("SDF DSF DSF DSF DFS ");
        print(state);
        if (state is VerifyOtpError) {
          SnackBarHelper.showSnackBar(
            context,
            message: state.otpverifyPojo?.message ?? "",
          );
        } else if (state is VerifyOtpSuccess) {

print("CODE IS RUNNING HEREEEEEEE");
          context.read<CheckEmailTickBloc>().add(CheckEmialEventTickStart(true));
          SnackBarHelper.showSnackBar(
            context,
            message: state.otpverifyPojo?.message ?? "",
          );
print("CODE IS RUNNING SSSSSSSSSSS");

Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            if (context.read<VerifyOtpBloc>().timer != null) {
              context.read<VerifyOtpBloc>().remainingSeconds = 30;
              context.read<VerifyOtpBloc>().timer!.cancel();
            }
            //  Get.back();
            Navigator.pop(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  if (context.read<VerifyOtpBloc>().timer != null) {
                    context.read<VerifyOtpBloc>().remainingSeconds = 30;
                    context.read<VerifyOtpBloc>().timer!.cancel();
                  }
                  Navigator.pop(context);
                },
                child: Transform.scale(
                    scale: 0.5,
                    child: const AssetImageWidget(
                      'assets/images/backArrow.png',
                    )),
              ),
              backgroundColor: PreferenceManger().getTheme() == false
                  ? Colors.white
                  : Colors.grey.shade900,
              title: textMedium(
                text: 'Verification',
                fontSize: ScreenUtils.width(context) * 0.05,
                color: PreferenceManger().getTheme() == false
                    ? Colors.black
                    : Colors.white,
              ),
              centerTitle: true,
            ),
            body: Container(
                width: ScreenUtils.width(context),
                height: ScreenUtils.height(context),
                decoration:
                    PreferenceManger().getTheme() == true ? blackd : whited,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtils.width(context) * 0.06,
                              right: ScreenUtils.width(context) * 0.06,
                              top: 6.0),
                          child: Utils.commonLighttitle(context,
                              'We have sent a 4-digit verification code to your email address.'),
                        ),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 9),
                                child: textMedium(
                                  text: 'Your Code here',
                                  fontSize:
                                      ScreenUtils.width(context) * 0.04 - 3,
                                  color: PreferenceManger().getTheme() == false
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtils.height(context) * 0.01,
                              ),
                              BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                                builder: (context, state) {
                                  return PinCodeTextField(
                                    controller: context
                                        .read<VerifyOtpBloc>()
                                        .otpController,
                                    keyboardType: TextInputType.number,
                                    appContext: context,
                                    length: 4,
                                    obscureText: false,
                                    animationType: AnimationType.fade,
                                    validator: (v) {
                                      if (v.toString().length < 3) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(12),
                                        fieldHeight:
                                            ScreenUtils.height(context) * 0.08,
                                        fieldWidth:
                                            ScreenUtils.width(context) * 0.2 -
                                                10,
                                        inactiveFillColor: Color(
                                            Utils.hexStringToHexInt('#DBB874')),
                                        activeColor: Color(
                                            Utils.hexStringToHexInt('#DBB874')),
                                        inactiveColor: Color(
                                            Utils.hexStringToHexInt('#DBB874')),
                                        selectedColor: Color(
                                            Utils.hexStringToHexInt('#DBB874')),
                                        selectedFillColor: Colors.white,
                                        activeFillColor: Colors.white),
                                    boxShadows: const [
                                      BoxShadow(
                                        offset: Offset(100, 100),
                                        color: Colors.red,
                                        blurRadius: 100,
                                      )
                                    ],
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    backgroundColor: Colors.transparent,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    cursorColor: Color(
                                        Utils.hexStringToHexInt('#DBB874')),
                                    enableActiveFill: false,
                                    textStyle: TextStyle(
                                        fontFamily: 'Poppins SemiBold',
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            Utils.hexStringToHexInt('#DBB874')),
                                        fontSize:
                                            ScreenUtils.width(context) * 0.1 -
                                                2),
                                    onChanged: (value) {
                                      context.read<VerifyOtpBloc>().otp = value;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22.0, right: 22.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                context.read<VerifyOtpBloc>().remainingSeconds >
                                        0
                                    ? 'Expires after ${context.read<VerifyOtpBloc>().remainingSeconds} s'
                                    : 'OTP Expired',
                                // Show "OTP Expired" when the timer hits 0
                                style: TextStyle(
                                  fontSize: 11,
                                  color: PreferenceManger().getTheme() == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontFamily: 'Poppins Light',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (context
                                              .read<VerifyOtpBloc>()
                                              .remainingSeconds ==
                                          0 &&
                                      context
                                          .read<VerifyOtpBloc>()
                                          .isResendEnabled) {
                                    // Resend OTP logic
                                    context
                                        .read<VerifyOtpBloc>()
                                        .otpController
                                        .clear();
                                    context.read<VerifyOtpBloc>().add(
                                        VerifyOtpResendEmailEvent(context
                                            .read<CheckEmailBloc>()
                                            .emailControllerSignup
                                            .text));
                                  } else {}
                                },
                                child: Text(
                                  'Resend',
                                  style: TextStyle(
                                    fontSize: font_12,
                                    color: context
                                                    .read<VerifyOtpBloc>()
                                                    .remainingSeconds ==
                                                0 &&
                                            context
                                                .read<VerifyOtpBloc>()
                                                .isResendEnabled
                                        ? Color(Utils.hexStringToHexInt(
                                            '#DBB874')) // Enable color
                                        : Colors.grey, // Disable color
                                    fontFamily: 'Poppins SemiBoldItalic',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtils.width(context) * 0.06,
                            right: ScreenUtils.width(context) * 0.06,
                            bottom: ScreenUtils.width(context) * 0.06,
                          ),
                          child: Center(
                            child: //context.read<CheckEmailBloc>().isOptVerified
                                5 != 5
                                    ? CircularProgressIndicator(
                                        color: Colors.red,
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Utils.commonLightedButton(
                                            context, "VERIFY AND CONTINUE",
                                            onTap: () {
                                          print(
                                              "SDF DSF DF${context.read<VerifyOtpBloc>().remainingSeconds} ");
                                          context.read<VerifyOtpBloc>().add(VerifyOtpStartEvent(
                                              context.read<VerifyOtpBloc>().otpController.text,
                                              context
                                                  .read<CheckEmailBloc>()
                                                  .emailControllerSignup
                                                  .text,
                                             ));
                                          // if (context
                                          //         .read<VerifyOtpBloc>()
                                          //         .remainingSeconds ==
                                          //     0) {
                                          //   SnackBarHelper.showSnackBar(context,
                                          //       message:
                                          //           "OTP Expired, Resend again please");
                                          // } else {
                                          //   context.read<VerifyOtpBloc>().add(VerifyOtpStartEvent(
                                          //       context
                                          //           .read<CheckEmailBloc>()
                                          //           .emailControllerSignup
                                          //           .text,
                                          //       context.read<VerifyOtpBloc>().otp));
                                          // }
                                        }),
                                      ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
