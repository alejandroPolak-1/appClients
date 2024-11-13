import 'package:flutter/material.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';

class UiStyle {
  static const TextStyle textFormStyle = TextStyle(
      fontFamily: 'DM Sans', fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle textStyle12Bold = TextStyle(
      fontFamily: 'DM Sans', fontSize: 12, fontWeight: FontWeight.bold);

  static const TextStyle textStyle20Bold = TextStyle(
      fontFamily: 'DM Sans', fontSize: 20, fontWeight: FontWeight.bold);

  static ButtonStyle loginButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: kcButtonBackgroundColor,
      foregroundColor: kcButtonTextColor,
      elevation: 0,
      minimumSize: Size(screenWidth(context) * 0.8, 50),
    );
  }
}
