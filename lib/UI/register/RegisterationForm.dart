import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/UI/login/login.dart';
import 'package:whiskey_with_bloc/bloc/signup/country/country_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/registerationBloc/imageuploadin/profile_image_bloc.dart';
import 'package:whiskey_with_bloc/bloc/signup/registerationBloc/imageuploadin/profile_image_event.dart';
import 'package:whiskey_with_bloc/bloc/signup/registerationBloc/imageuploadin/profile_image_state.dart';
import 'package:whiskey_with_bloc/untils/SnackBarHelper.dart';
import 'package:whiskey_with_bloc/untils/widget/country_list.dart';

import '../../bloc/signup/registerationBloc/registeration_form_bloc.dart';
import '../../untils/Utiks.dart';
import '../../untils/dialog/CameraGalleryDialogMobile.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../untils/local/app_values.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/commonUtility.dart';
import '../../untils/widget/commoncomponent.dart';
import '../../untils/widget/profile_image_widget.dart';
import '../../untils/widget/registeration_button.dart';
import '../../untils/widget/textfiled_mobile.dart';
import '../../webfile/appConstant.dart';

class RegisterationFormMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // controller.setEmail(SharedPrefs.getString("email"));

    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
        return Future.value(false);
      },
      child: BlocConsumer<RegisterationFormBloc, RegisterationFormFieldState>(
                listener: (context, state) {},
                builder: (context, state) {

      final bloc = context.read<RegisterationFormBloc>();
      var email=SharedPrefs.getString("email");
      bloc.add(UpdateEmailEvent(email));
      return Scaffold(
          body:  BlocBuilder<RegisterationFormBloc,
                  RegisterationFormFieldState>(
                  builder: (context, state) {
                    print(state);
                    return Container(
                        width: ScreenUtils.width(context),
                        height: ScreenUtils.height(context),
                        decoration:
                            PreferenceManger().getTheme() == true
                                ? blackd
                                : whited,
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()),
                                            );
                                          },
                                          child: Image(
                                            image: const AssetImage(
                                                'assets/images/buttonbackground/arrowwithroundedcontainer.png'),
                                            // Update with your image path
                                            height:
                                            ScreenUtils.width(context) *
                                                0.09,
                                            width: ScreenUtils.height(
                                                context) *
                                                0.09,
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: ScreenUtils.width(
                                                  context) *
                                                  0.06),
                                          child: Text(
                                            'Complete Profile',
                                            style: TextStyle(
                                              fontSize: font_22,
                                              color: PreferenceManger()
                                                  .getTheme() ==
                                                  false
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
                                  ),
                                  SizedBox(
                                    height:
                                    ScreenUtils.height(context) * 0.02,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenUtils.width(context) *
                                            0.07),
                                    child: Container(
                                      width: ScreenUtils.width(context) * 1,
                                      height:
                                      ScreenUtils.height(context) * 0.1,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                PreferenceManger()
                                                    .getTheme() ==
                                                    true
                                                    ? 'assets/images/buttonbackground/stepper_one.png'
                                                    : 'assets/images/buttonbackground/setpperlight/Group 41420.png',
                                              ),
                                              fit: BoxFit.fitWidth)),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              ScreenUtils.height(context) *
                                                  0.01,
                                        ),
                                        Utils.registrationMediumText(
                                            context,
                                            "Set up Collector Profile"),
                                        SizedBox(
                                          height:
                                              ScreenUtils.height(context) *
                                                  0.02,
                                        ),
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              chooseImageFromGalleryOrCameraMobile(
                                                  context);
                                            },
                                            child: ProfileImageWidget(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Center(
                                          child: Text(
                                            "Add Profile picture",
                                            style: TextStyle(
                                                color: PreferenceManger()
                                                            .getTheme() ==
                                                        false
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: ScreenUtils.width(
                                                            context) *
                                                        0.03 -
                                                    1,
                                                fontFamily:
                                                    'Poppins Medium'),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              ScreenUtils.height(context) *
                                                  0.03,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: CustomTextInputMobile(
                                                title: 'First Name',
                                                rightIcon:
                                                    'assets/images/facebook.png',
                                                isPass: false,
                                                isSuffix: false,
                                                controller: bloc
                                                    .firstNameController,
                                                onChanged: (value){
                                                  bloc.add(UpdateFirstNameEvent(value));
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: CustomTextInputMobile(
                                                title: 'Last Name',
                                                rightIcon:
                                                    'assets/images/facebook.png',
                                                isPass: false,
                                                isSuffix: false,
                                                controller:
                                                    bloc.lastNameController,
                                                onChanged: (value){
                                                  bloc.add(UpdateLastNameEvent(value));
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              ScreenUtils.height(context) *
                                                  0.02,
                                        ),
                                        CustomTextInputMobile(
                                          title: 'WhiskeyTrove Screen Name',
                                          rightIcon:
                                              'assets/images/facebook.png',
                                          isPass: false,
                                          isSuffix: false,
                                          controller:
                                              bloc.screenNameController,
                                          onChanged: (value){
                                            bloc.add(UpdateScreenNameEvent(value));
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                              ScreenUtils.height(context) *
                                                  0.02,
                                        ),
                                        CustomTextInputMobile(
                                          readOnly: true,
                                          title: 'Email',
                                          rightIcon:
                                              'assets/images/facebook.png',
                                          isPass: false,
                                          isSuffix: false,
                                          controller: bloc.emailController,
                                        ),

                                    SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),

                                CustomTextInputMobile(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder:
                                            (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              width: 300,
                                              height: 300,
                                              child: YearPicker(
                                                firstDate: DateTime(
                                                    DateTime.now()
                                                            .year -
                                                        100,
                                                    1),
                                                lastDate: DateTime(
                                                    DateTime.now()
                                                            .year -
                                                        21,
                                                    1),
                                                initialDate:
                                                    DateTime.now(),
                                                selectedDate:
                                                    DateTime.now(),
                                                onChanged: (DateTime
                                                    dateTime) {
                                                  WidgetsBinding
                                                      .instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    if (context
                                                        .mounted) {
                                                      print(
                                                          "SSS S S S S S S");
                                                      context
                                                          .read<
                                                              RegisterationFormBloc>()
                                                          .add(UpdateDobEvent(
                                                              "${dateTime.year}"));
                                                      Navigator.of(
                                                              context)
                                                          .pop();
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  readOnly: true,
                                  title: 'Year of Birth',
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  controller:
                                      context.read<RegisterationFormBloc>().birthYearController,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),
                                CustomTextInputMobile(
                                  controller:
                                      bloc.countryController,
                                  title: 'Country',
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  readOnly: true,
                                  onTap: () {

                                    bloc.add(ToggleCountryListVisibilityEvent(!state.countryVisiListshow ));




                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),

                                state.countryVisiListshow == false
                                    ? SizedBox()
                                    : CountryList(),


                                   state.countryVisiListshow == false
                                   ? SizedBox()
                                   : SizedBox(
                                       height: ScreenUtils.height(
                                               context) *
                                           0.02,
                                     ),
                                CustomTextInputMobile(
                                  controller:
                                      bloc.zipCodeController,
                                  title: 'Zip Code',
                                  maxLength: 10,
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  keyBoardType:
                                      TextInputType.number,
                                  isSuffix: false,
                                  onChanged: (val) {
                                    print("SDF SD FDSF DF ");
                                    print( bloc.zipCodeController.text);
                                     if (val.length >= 5 &&
                                         bloc.countryController
                                                 .text ==
                                             'United States') {
                                       if(bloc
                                           .zipCodeController
                                           .text.isNotEmpty){
                                         context
                                             .read<CountryBloc>()
                                             .add(CityByZipEvent(bloc
                                             .zipCodeController
                                             .text));
                                       }

                                     } else {}
                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),
                                CustomTextInputMobile(
                                  controller: bloc.stateController,
                                  title: 'State',
                                  readOnly: false,
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  onTap: () {
                                    // controller.stateVisiList =
                                    // !controller.stateVisiList;
                                    // print(controller.stateLists.length);
                                    // controller.update();
                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),
                                CustomTextInputMobile(
                                  controller: bloc.cityController,
                                  title: 'City',
                                  readOnly: false,
                                  onTap: () {
                                    // controller.cityVisiList =
                                    // !controller.cityVisiList;
                                    // controller.update();
                                  },
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(8.0),
                                  child: Utils.sisteenptMediumText(
                                      context,
                                      "Add your social networks"),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.01,
                                ),
                                CustomTextInputMobile(
                                  title: 'Twitter',
                                  hint:
                                      'https://twitter.com/username',
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  controller:
                                      bloc.twitterController,
                                  onChanged: (value){
                                    bloc.add(UpdateTweeterUrlEvent(value));
                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.01,
                                ),
                                CustomTextInputMobile(
                                  title: 'Facebook',
                                  hint:
                                      'https://Facebook.com/username',
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  controller:
                                      bloc.facebookController,
                                  onChanged: (value){
                                    bloc.add(UpdateFacebookUrlEvent(value));
                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.02,
                                ),
                                CustomTextInputMobile(
                                  title: 'Instagram',
                                  hint:
                                      'https://Instagram.com/username',
                                  rightIcon:
                                      'assets/images/facebook.png',
                                  isPass: false,
                                  isSuffix: false,
                                  controller:
                                      bloc.instagramController,
                                  onChanged: (value){
                                    bloc.add(UpdateInstagramUrlEvent(value));
                                  },
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.1,
                                ),

                                        RegisterationButton(),
                                SizedBox(
                                  height:
                                      ScreenUtils.height(context) *
                                          0.05,
                                ),
                              ],
                            ),
                                                  )
                                                ],
                                              ),
                                            ),
                              state.loading?Center(child: CircularProgressIndicator(),):SizedBox()


                          ],
                        ));
          },
        ));
        },
      ));
  }

  void chooseImageFromGalleryOrCameraMobile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return CameraGalleryDialogMobile(
          () => _handleImageSelection(
              context, () => CommonUtility().openCame(dialogContext)),
          () => _handleImageSelection(
              context, () => CommonUtility().openGallery(dialogContext)),
          "Add Picture",
        );
      },
    );
  }

  Future<void> _handleImageSelection(
      BuildContext context, Future<File?> Function() imageGetter) async {
    try {
      final image = await imageGetter();
      if (image != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            context
                .read<ProfileImageBloc>()
                .add(ImageSelectedUploadEvent(image));
            context
                .read<RegisterationFormBloc>()
                .add(UpdateImageFileEvent(image));
          }
        });
      }
    } catch (e) {
      print("Error selecting image: $e");
    }
  }
}
