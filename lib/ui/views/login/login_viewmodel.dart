import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:tots_stacked_app/api_repository/params/_params.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:tots_stacked_app/services/api_service.dart';
import 'package:tots_stacked_app/ui/views/login/login_view.form.dart';
import 'package:tots_stacked_app/utils/validators/text_input_validators.dart';

class LoginViewModel extends FormViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  bool isLoggedIn = false;
  bool firstLogin = true;

  // @override
  // setFormStatus() {
  //    super.setFormStatus();
  // }

  bool _obscurePassword = true;
  bool get isObscurePassword => _obscurePassword;

  void toggle() {
    _obscurePassword = !_obscurePassword;
    rebuildUi();
  }

  @override
  Future<void> setValidationMessages(
      Map<String, String?> validationMessages) async {
    super.setValidationMessages(validationMessages);
    // Handle any additional logic after setting validation messages
  }

  void validateForm() {
    final validationMessages = <String, String?>{};

    // Validate each field and collect messages
    final mailInputMessage =
        TextInputValidators.validateMailText(formValueMap['Mail']);
    if (mailInputMessage != null) {
      validationMessages['Mail'] = mailInputMessage;
    } else {
      setMailValidationMessage(null);
    }

    final passwordInputMessage =
        TextInputValidators.validatePasswordText(formValueMap['Password']);
    if (passwordInputMessage != null) {
      validationMessages['Password'] = passwordInputMessage;
    } else {
      setPasswordValidationMessage(null);
    }

    setValidationMessages(validationMessages);
  }

  Future<void> login({required String email, required String password}) async {

    firstLogin = false;
    rebuildUi();
    
    if (!isFormValid) {
      return;
    }

    final response = await _apiService
        .postLogin(LoginBody(email: email, password: password));

    if (response == true) {
      isLoggedIn = true;
      _navigationService.replaceWithHomeView();
      return;
    }

    passwordValidationMessage!;
    mailValidationMessage!;
    return;
  }
}
