import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signup/registerationBloc/imageuploadin/profile_image_bloc.dart';
import '../../bloc/signup/registerationBloc/imageuploadin/profile_image_state.dart';
import '../../bloc/signup/registerationBloc/registeration_form_bloc.dart';
import '../../webfile/appConstant.dart';
import '../SnackBarHelper.dart';
import '../local/preference.dart';
import '../local/screenUtils.dart';
class ProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileImageBloc, ProfileImageState>(
      listener: (context, state) {
        if (state is ProfileImageUploadSuccess) {
          context.read<RegisterationFormBloc>().add(UpdateImageEvent(state.imageUrl));
        } else if (state is ProfileImageUploadError) {
          SnackBarHelper.showSnackBar(context, message: "Could not upload image, Please try again");
        }
      },
      builder: (context, state) {
        if (state is ProfileImageLoading) {
          return _buildLoadingWidget(state,context);
        } else if (state is ProfileImageUploadError) {
          return _buildErrorWidget(context);
        } else if (state is ProfileImageUploadSuccess) {
          return _buildSuccessWidget(context, state);
        } else {
          return _buildDefaultWidget(context);
        }
      },
    );
  }

  Widget _buildLoadingWidget(ProfileImageLoading state,BuildContext context) {
    return Stack(
      children: [
        Center(
          child: state.imageUrl != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: ScreenUtils.width(context) * 0.2 + 2,
              height: ScreenUtils.height(context) * 0.1 + 2,
              child: Image.file(state.imageUrl, fit: BoxFit.fill),
            ),
          )
              : SizedBox(),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Container(
      width: ScreenUtils.width(context) * 0.2 + 2,
      height: ScreenUtils.height(context) * 0.1 + 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            PreferenceManger().getTheme() == true
                ? "assets/images/buttonbackground/dottedborder.png"
                : 'assets/images/addImageCard.png',
          ),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/buttonbackground/duppmyprofileimage.png',
          width: ScreenUtils.width(context) * 0.05,
          height: ScreenUtils.width(context) * 0.05,
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context, ProfileImageUploadSuccess state) {
    return BlocBuilder<RegisterationFormBloc, RegisterationFormFieldState>(
      builder: (context, formState) {
        if (formState.imageFile != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: ScreenUtils.width(context) * 0.2 + 2,
              height: ScreenUtils.height(context) * 0.1 + 2,
              child: Image.file(formState.imageFile!, fit: BoxFit.fill),
            ),
          );
        } else if (formState.image.isEmpty) {
          return _buildDefaultWidget(context);
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              child: Image.network(
                '${AppConstant.IMAGE_BASE_URL}${formState.image}',
                width: ScreenUtils.width(context) * 0.2 + 2,
                height: ScreenUtils.height(context) * 0.1 + 2,
                fit: BoxFit.fill,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildDefaultWidget(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenUtils.width(context) * 0.2 + 2,
        height: ScreenUtils.height(context) * 0.1 + 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              PreferenceManger().getTheme() == true
                  ? "assets/images/buttonbackground/dottedborder.png"
                  : 'assets/images/addImageCard.png',
            ),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/buttonbackground/duppmyprofileimage.png',
            width: ScreenUtils.width(context) * 0.05,
            height: ScreenUtils.width(context) * 0.05,
          ),
        ),
      ),
    );
  }
}