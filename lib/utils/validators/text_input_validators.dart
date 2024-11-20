import 'package:tots_stacked_app/ui/common/_common.dart';

class TextInputValidators {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,6}$',
  );

  static String? validateMailText(String? value) {
    if (value == null) {
      return null;
    }

    if (!emailRegExp.hasMatch(value)) {
      return ksErrorInputEmail;
    }

    return null;
  }

  static String? validatePasswordText(String? value) {
    if (value == null || value.isEmpty) {
      return ksErrorInputPassword;
    }

    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return 'La contraseña debe contener al menos una letra mayúscula';
    // }
    // if (!RegExp(r'[a-z]').hasMatch(value)) {
    //   return 'La contraseña debe contener al menos una letra minúscula';
    // }
    // if (!RegExp(r'[0-9]').hasMatch(value)) {
    //   return 'La contraseña debe contener al menos un número';
    // }

    return null;
  }

  static String? validateFirstNameText(String? value) {
    if (value == null || value.isEmpty) {
      return 'The name cannot be empty';
    }
    return null;
  }

  static String? validateLastNameText(String? value) {
    if (value == null || value.isEmpty) {
      return 'The name cannot be empty';
    }
    return null;
  }
}
