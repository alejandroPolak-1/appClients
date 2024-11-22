import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';

class UiStyle {
  static TextStyle base(double? fontSize,
      {FontWeight fontWeight = FontWeight.normal, Color? color}) {
    return GoogleFonts.dmSans(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
// fasterOne
  

  static TextStyle bold(double fontSize, {Color? color}) {
    return base(
      fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  static ButtonStyle loginButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: kcButtonBackgroundColor,
      foregroundColor: kcButtonTextColor,
      elevation: 0,
      minimumSize: Size(screenWidth(context) * 0.8, 50),
    );
  }
}
