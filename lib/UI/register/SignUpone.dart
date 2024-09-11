import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whiskey_with_bloc/UI/register/VerifyOtp.dart';
import 'package:whiskey_with_bloc/bloc/signup/checkemail/check_email_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/verify_otp_bloc.dart';
import 'package:whiskey_with_bloc/untils/local/app_values.dart';

import '../../bloc/signup/checkemailtick/check_emial_bloc.dart';
import '../../bloc/signup/checkuserage/check_user_age_bloc.dart';
import '../../untils/SnackBarHelper.dart';
import '../../untils/Utiks.dart';
import '../../untils/color_code.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/commoncomponent.dart';
import '../../untils/widget/textfiled_mobile.dart';

class SignUpMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CheckEmailBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<CheckEmailBloc, CheckEmailState>(
        listener: (context, state) {
          if (state is CheckEmailError) {
            SnackBarHelper.showSnackBar(
              context,
              message: state.checkEmailPojo?.message ?? "",
            );
          } else if (state is CheckEmailSuccess) {
            SnackBarHelper.showSnackBar(
              context,
              message: state.checkEmailPojo?.message ?? "",
            );
            context.read<VerifyOtpBloc>().otpController =
                TextEditingController();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VerifyOtp()),
            );
          }else if(state is RegisterUserSuccess){

            context.read<CheckEmailTickBloc>().add(CheckEmialEventTickStart(false));
            context.read<CheckUserAgeBloc>().add(CheckUserAge(false));
            SnackBarHelper.showSnackBar(
              context,
              message: "${state.data}",
            );
          }
        },
        builder: (context, state) {
          return Container(
            width: ScreenUtils.width(context),
            height: double.infinity,
            decoration: PreferenceManger().getTheme() == true ? blackd : whited,
            child: Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              width: ScreenUtils.width(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.08 - 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CheckEmailBloc>()
                                    .emailControllerSignup.clear();
                                context
                                    .read<CheckEmailBloc>()
                                    .passwordControllerSignup.clear();

                                context
                                    .read<CheckEmailBloc>()
                                    .confirmPasswordControllerSignup.clear();
                                context
                                    .read<VerifyOtpBloc>()
                                    .isResendEnabled=true;

                              //  Navigator.of(context).pop();
                              },
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/buttonbackground/arrowwithroundedcontainer.png'),
                                height: ScreenUtils.width(context) * 0.09,
                                width: ScreenUtils.height(context) * 0.09,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtils.width(context) * 0.06),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: font_22,
                                  color: PreferenceManger().getTheme() == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontFamily:
                                      'Poppins SemiBold', // Update with your font
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextInputMobile(
                          title: 'Email',
                          isPass: false,
                          isSuffix: true,
                          rightIcon: "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            //   return EmailValidator.validateEmail(val);
                          },
                          controller: context
                              .read<CheckEmailBloc>()
                              .emailControllerSignup,
                        ),
                        // Update with your image path
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.02,
                        ),
                        CustomTextInputMobile(
                          title: 'Password',
                          rightIcon: 'eyeOn',
                          isSuffix: true,
                          isPass: true,
                          controller: context
                              .read<CheckEmailBloc>()
                              .passwordControllerSignup,
                        ),

                        hintTexxt(context,
                            'Password length should be at least six characters, password should contain at least one uppercase letter, one lowercase letter, one number and one special character.'),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.02,
                        ),
                        CustomTextInputMobile(
                            title: 'Confirm Password',
                            rightIcon: 'eyeOff',
                            isPass: true,
                            isSuffix: true,
                            controller: context
                                .read<CheckEmailBloc>()
                                .confirmPasswordControllerSignup),
                        const SizedBox(
                          height: 10.0,
                        ),





                        BlocBuilder<CheckEmailTickBloc, CheckEmialCheckState>(
                          builder: (context, state) {
                            bool isEmailVerifyed = false;

                            // Check the state and determine if the email is verified
                            if (state is CheckEmailTickStartState) {
                              isEmailVerifyed = state.emailCheck;
                            }

                            return Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtils.width(context) * 0.01),
                              child: GestureDetector(
                                onTap: () async {
                                  // Trigger the email verification check
                                  bloc.add(StartCheckEmailEvent(context
                                      .read<CheckEmailBloc>()
                                      .emailControllerSignup
                                      .text));  // Trigger event with 'true' for email check
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: isEmailVerifyed,
                                      onChanged: (value) {},
                                      checkColor:
                                      PreferenceManger().getTheme() == true
                                          ? Colors.black
                                          : Colors.white,
                                      activeColor: Color(
                                          Utils.hexStringToHexInt('#DBB874')),
                                      side: BorderSide(
                                          color: Color(Utils.hexStringToHexInt(
                                              '#917C49'))),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    SizedBox(
                                        width: ScreenUtils.width(context) * 0.01),
                                    Flexible(
                                      child: Text(
                                        'Please click here to first verify your email address.',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Poppins Regular',
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(
                                              Utils.hexStringToHexInt(
                                                  '#DBB874')),
                                          color: Color(Utils.hexStringToHexInt(
                                              '#DBB874')),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),





                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtils.width(context) * 0.01),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [

                                BlocBuilder<CheckUserAgeBloc, CheckUserAgeState>(
                                  builder: (context, state) {
                                    bool isAbove21 = false;
                                    if (state is CheckUserAgeTick) {
                                      isAbove21 = state.age;
                                    }
                                    return Checkbox(
                                      value: isAbove21,
                                      checkColor:
                                          PreferenceManger().getTheme() == true
                                              ? Colors.black
                                              : Colors.white,
                                      activeColor: Color(
                                          Utils.hexStringToHexInt('#DBB874')),
                                      side: BorderSide(
                                          color: Color(Utils.hexStringToHexInt(
                                              '#917C49'))),
                                      onChanged: (value) {
                                        print("SDF SDF SDF ");
                                        context.read<CheckUserAgeBloc>().add(CheckUserAge(value ?? false));
                                        // .over21Checked = value!;
                                      },
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                    );
                                  },
                                ),


                                SizedBox(
                                    width: ScreenUtils.width(context) * 0.01),
                                Column(
                                  children: <Widget>[
                                    const SizedBox(height: 1.0),
                                    Text(
                                      'I am 21 years old',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins Regular',
                                        // Update with your font
                                        color: PreferenceManger().getTheme() ==
                                                false
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.2 -
                          ScreenUtils.height(context) * 0.08,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin_15),
                      child: SizedBox(
                        width: ScreenUtils.width(context),
                        child: ElevatedButton(
                          onPressed: () {
                            // Get.to(EnableFaceId());
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                PreferenceManger().getTheme() == true
                                    ? appColor.withOpacity(0.1)
                                    : Color(Utils.hexStringToHexInt('#f5ebdb')),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 2.0,
                                color:
                                    Color(Utils.hexStringToHexInt('#DBB874')),

                                //#DBB87440
                              ), // Black border
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          child: Text(
                            'ENABLE FACE ID',
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
                    ),
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.04 - 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin_15),
                      child: Utils.commonLightedButton(context, "CONTINUE",
                          onTap: () {


                             final emailVerified = context.read<CheckEmailTickBloc>().state.props[0]??false;
                             var ageChecked = context.read<CheckUserAgeBloc>().state.props[0]??false;
                             print(ageChecked.toString());
                              context.read<CheckEmailBloc>().add(RegisterUserEvent(
                                  isAbove21: ageChecked,
                                  isEmailVerified: emailVerified,
                                  password: bloc.passwordControllerSignup.text,
                                  email: bloc.emailControllerSignup.text
                              ));
                      }),
                    ),
                    SizedBox(
                      height: ScreenUtils.height(context) * 0.08,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: margin_15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'By creating an account, you agree to our',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins Light',
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  //   Get.to(TermsCondition());
                                },
                                child: const Text(
                                  'Terms of Service',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins SemiBold',
                                      color: Colors.white),
                                ),
                              ),
                              const Text(
                                ' and ',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins Light',
                                    color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  //  Get.to(PrivacyPolicy());
                                },
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins SemiBold',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  hintTexxt(context, text) {
    return Padding(
        padding: EdgeInsets.only(left: margin_4),
        child: textRegular(
            text: text,
            maxLines: 3,
            fontSize: ScreenUtils.width(context) * 0.02,
            color: PreferenceManger().getTheme() == true
                ? Colors.white.withOpacity(0.5)
                : Colors.black.withOpacity(0.5)));
  }
}
