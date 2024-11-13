import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';

import 'custombutton_model.dart';

class Custombutton extends StackedView<CustombuttonModel> {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double widthFactor; // Factor para el ancho
  final double height; // Altura del botón
  final double fontSize; // Tamaño de la fuente

  const Custombutton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = kcButtonBackgroundColor,
    this.textColor = kcButtonTextColor, // Color de texto por defecto
    this.widthFactor = 0.8, // Factor de ancho por defecto
    this.height = 50.0, // Altura por defecto
    this.fontSize = 14.0, // Tamaño de fuente por defecto
  });

  @override
  Widget builder(
    BuildContext context,
    CustombuttonModel viewModel,
    Widget? child,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        minimumSize:
            Size(MediaQuery.of(context).size.width * widthFactor, height),
      ),
      child: Text(
        label,
        style: TextStyle(fontFamily: 'DM Sans', fontSize: fontSize),
      ),
    );
  }

  @override
  CustombuttonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustombuttonModel();
}
