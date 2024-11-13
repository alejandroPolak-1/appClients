class TextInputValidators {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,6}$',
  );

  static String? validateMailText(String? value) {
    if (value == null) {
      return null;
    }

    if (!emailRegExp.hasMatch(value)) {
      return 'Ingresa un formato de correo válido';
    }

    return null;
  }

  static String? validatePasswordText(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra minúscula';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'La contraseña debe contener al menos un número';
    }

    return null;
  }
}
