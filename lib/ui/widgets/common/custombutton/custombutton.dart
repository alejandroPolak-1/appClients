import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/enums.dart';
import 'package:tots_stacked_app/ui/common/ui_style.dart';

import 'custombutton_model.dart';

class Custombutton extends StackedView<CustombuttonModel> {
  final String label;
  final bool isLoadign;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double widthFactor; // Factor para el ancho
  final double height; // Altura del botón
  final double fontSize; // Tamaño de la fuente
  final ButtonType buttonType; // Tipo de botón

  const Custombutton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = kcButtonBackgroundColor,
    this.textColor = kcButtonTextColor,
    this.widthFactor = 0.8,
    this.height = 50.0,
    this.fontSize = 14.0,
    this.buttonType = ButtonType.primary,
    this.isLoadign = false,
  });

  @override
  Widget builder(
    BuildContext context,
    CustombuttonModel viewModel,
    Widget? child,
  ) {
    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(textColor),
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(
        Size(MediaQuery.of(context).size.width * widthFactor, height),
      ),
      textStyle: WidgetStateProperty.all(
        UiStyle.base(fontSize),
      ),
    );

    return buttonType == ButtonType.primary
        ? ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: isLoadign ? const CircularProgressIndicator() : Text(label),
          )
        : TextButton(
            onPressed: onPressed,
            style: buttonStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Text(label),
          );

   
  }

  @override
  CustombuttonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustombuttonModel();
}
