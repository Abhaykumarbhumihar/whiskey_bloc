import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


import '../local/preference.dart';
import '../local/screenUtils.dart';

class CommonUtility {
  static void showPermissionDeniedDialog(
      BuildContext context, String permissionType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Denied"),
          content: Text(
              "You have denied access to $permissionType. Please grant the permission in settings."),
          actions: [
            TextButton(
              onPressed: () {
             //   Navigator.of(context).pop();
             //   openAppSettings();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<File?> openCame(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      var image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        File rotatedImage =
            await FlutterExifRotation.rotateAndSaveImage(path: image.path);
        return cropImage(rotatedImage.path);
      }

      return null;
    } catch (err) {
      showPermissionDeniedDialog(context, "Camera");
    }
  }

  Future<File?> openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      var picture = await _picker.pickImage(
          source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
      if (picture != null) {
        if (!kIsWeb) {
          File rotatedImage =
              await FlutterExifRotation.rotateAndSaveImage(path: picture.path);
          return cropImage(rotatedImage.path);
        } else {
          print(picture.path);
          return File(picture.path);
        }
      }
    } catch (err) {
      showPermissionDeniedDialog(context, "Gallery");
    }
  }

  Future<File?> cropImage(filePath) async {
    var croppedImage = await ImageCropper(

    ).cropImage(
      sourcePath: filePath,

     // aspectRatioPresets: [CropAspectRatioPreset.original],
    );
    if (croppedImage == null) {
      CommonUtility.showSnackbarValidationError('No Image Found');
    } else {
      return File(croppedImage.path);
    }
    return null;
  }

  static showSnackbarValidationError(String message) {
    // if (Get.isSnackbarOpen == true) Get.closeAllSnackbars();
    // Get.snackbar('WhiskeyTrove', message,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //     borderRadius: 8.0,
    //     duration: Duration(milliseconds: 1500));
  }

  static showSnackbarValidationErrortop(String message) {
    // if (Get.isSnackbarOpen == true) Get.closeAllSnackbars();
    // Get.snackbar('WhiskeyTrove', message,
    //     snackPosition: SnackPosition.TOP,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //     borderRadius: 8.0,
    //     duration: Duration(milliseconds: 1500));
  }

  static showSnackbarsuccess(title, String message) {
    // if (Get.isSnackbarOpen == true) Get.closeAllSnackbars();
    // Get.snackbar("WhiskeyTrove", message,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.green,
    //     colorText: Colors.white,
    //     borderRadius: 8.0,
    //     duration: Duration(milliseconds: 1500));
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static Widget showLoader(BuildContext context) {
    var theme = PreferenceManger().getTheme();
    return Container(
      padding: EdgeInsets.zero,
      width: ScreenUtils.width(context),
      height: ScreenUtils.height(context),
      color: Colors.transparent,
      child: Center(
        child: SpinKitFadingFour(
          color: theme == false ? Colors.black : Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
