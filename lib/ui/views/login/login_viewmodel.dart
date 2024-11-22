import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:tots_stacked_app/services/login_service_service.dart';
import 'package:tots_stacked_app/services/secure_storage_service.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/views/login/login_view.form.dart';
import 'package:tots_stacked_app/utils/validators/text_input_validators.dart';

class LoginViewModel extends FormViewModel {
  final _apiService = locator<LoginServiceService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _storageService = SecureStorageService();

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

  // void validateForm() {
  //   final validationMessages = <String, String?>{};

  //   // Validate each field and collect messages
  //   final mailInputMessage =
  //       TextInputValidators.validateMailText(formValueMap['Mail']);
  //   if (mailInputMessage != null) {
  //     validationMessages['Mail'] = mailInputMessage;
  //   } else {
  //     setMailValidationMessage(null);
  //   }

  //   final passwordInputMessage =
  //       TextInputValidators.validatePasswordText(formValueMap['Password']);
  //   if (passwordInputMessage != null) {
  //     validationMessages['Password'] = passwordInputMessage;
  //   } else {
  //     setPasswordValidationMessage(null);
  //   }

  //   setValidationMessages(validationMessages);
  //
  void validateForm() {
    final validationMessages = <String, String?>{
      ksLoginLabelMail:
          TextInputValidators.validateMailText(formValueMap[ksLoginLabelMail]),
      ksLoginLabelPassword: TextInputValidators.validatePasswordText(
          formValueMap[ksLoginLabelPassword]),
    };

    setValidationMessages(validationMessages);

    // Clear validation messages for valid fields
    if (validationMessages[ksLoginLabelMail] == null)
      setMailValidationMessage(null);
    if (validationMessages[ksLoginLabelPassword] == null)
      setPasswordValidationMessage(null);
  }

  Future<void> login({required String email, required String password}) async {
    setBusy(true);

    firstLogin = false;

    if (!isFormValid) {
      setBusy(false);
      return;
    }

    final response = await _apiService
        .postLogin(LoginBody(email: email, password: password));

    response.fold((l) {
      setBusy(false);
      _dialogService.showDialog(
        title: ksErrorTitleLoginRespone,
        // description: ksErrorDescriptionLoginRespone,
        description:
            "$ksErrorDescriptionLoginRespone \n ${l.message} \n $email \n $password",
      );
    }, (r) {
      setBusy(false);
      loginGetStorageData(r);
      _navigationService.replaceWithHomeView();
      // passwordValidationMessage!;
      // mailValidationMessage!;
    });

    return;
  }

  Future<void> loginGetStorageData(Login r) async {
    API.getInstance().setToken(r.accessToken.toString());

    _storageService.saveToken(r.accessToken.toString());
  }
}
