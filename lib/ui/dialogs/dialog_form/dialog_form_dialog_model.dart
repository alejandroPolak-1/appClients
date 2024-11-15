import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/dialogs/dialog_form/dialog_form_dialog.form.dart';
import 'package:tots_stacked_app/utils/validators/text_input_validators.dart';

class DialogFormDialogModel extends FormViewModel {
  // final _dialogService = locator<DialogService>();
  final _navidateService = locator<NavigationService>();

  String firstname = '';
  String lastname = '';
  String email = '';

  void setInitialValues(
      {required String firstname,
      required String lastname,
      required String email}) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    notifyListeners(); // Notifica a la vista sobre los cambios
  }

  void getBack() {
    _navidateService.back();
  }

  void validateForm() {
    final validationMessages = <String, String?>{};

    // Validate each field and collect messages
    final mailInputMessage = TextInputValidators.validateMailText(
        formValueMap[ksLabelEmailAdressClient]);
    if (mailInputMessage != null) {
      validationMessages[ksLabelEmailAdressClient] = mailInputMessage;
    } else {
      setEmailAddressValidationMessage(null);
    }

    final firstNamleInputMessage = TextInputValidators.validateFirstNameText(
        formValueMap[ksLabelFirstNameClient]);
    if (firstNamleInputMessage != null) {
      validationMessages[ksLabelFirstNameClient] = firstNamleInputMessage;
    } else {
      setFirstNameValidationMessage(null);
    }

    final lastNameInputMessage = TextInputValidators.validateLastNameText(
        formValueMap[ksLabelLastNameClient]);
    if (lastNameInputMessage != null) {
      validationMessages[ksLabelLastNameClient] = lastNameInputMessage;
    } else {
      setFirstNameValidationMessage(null);
    }

    setValidationMessages(validationMessages);
  }
}
