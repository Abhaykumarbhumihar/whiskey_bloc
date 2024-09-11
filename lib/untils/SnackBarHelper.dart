import 'package:flutter/material.dart';

class SnackBarHelper {
  // Method to show a SnackBar
  static void showSnackBar(BuildContext context, {
    required String message,
    Color backgroundColor = Colors.blueAccent,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    Color closeIconColor = Colors.black,
    double padding = 8.0,
    double elevation = 8.0,
    double borderRadius = 20.0,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: behavior,
        padding: EdgeInsets.all(padding),
        elevation: elevation,
        showCloseIcon: true,
        closeIconColor: closeIconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
