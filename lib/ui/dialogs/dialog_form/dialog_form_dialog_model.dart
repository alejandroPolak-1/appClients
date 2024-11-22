// import 'package:stacked_app/app/app.bottomsheets.dart';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/api_repository/params/body/client_body.dart';
import 'package:tots_stacked_app/api_repository/params/clients_params.dart';
import 'package:tots_stacked_app/app/app.bottomsheets.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:tots_stacked_app/ui/common/_common.dart';
import 'package:tots_stacked_app/services/_services.dart';
import 'package:tots_stacked_app/ui/dialogs/dialog_form/dialog_form_dialog.form.dart';
import 'package:tots_stacked_app/ui/views/home/home_view.dart';
import 'package:tots_stacked_app/utils/validators/text_input_validators.dart';

class DialogFormDialogModel extends FormViewModel {
  final _snackService = locator<SnackbarService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ClientService>();
  final _imagePickerService = locator<ImagePickerService>();

  String firstname = '';
  String lastname = '';
  String email = '';
  int? idClient;
  String? photo;

  XFile? image;

  void navigateHome() async {
    // await Future.delayed(const Duration(seconds: 3));
    _navigationService.clearStackAndShowView(const HomeView());
    rebuildUi();
  }

  void getBack() {
    _navigationService.back();
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

  Future showBootonModal() async {
    return await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<bool?> updateClient(ClientParams params) async {
    setBusy(true);

    if (!isFormValid) {
      setBusy(false);
      return false;
    }

    final response = await _apiService.updateClient(params);

    return response.fold((l) {
      setBusy(false);

      _snackService.showCustomSnackBar(
          message: 'No pudimos ',
          title: 'Ups!',
          variant: SnackbarConfig(backgroundColor: kcErrorColorBG),
          duration: const Duration(seconds: 2));

      return false;
    }, (r) {
      setBusy(false);

      showBootonModal();
      _snackService.showCustomSnackBar(
          message: 'No pudimos ',
          title: 'Ups!',
          variant: SnackbarConfig(backgroundColor: kcErrorColorBG),
          duration: const Duration(seconds: 2));

      //  _snackService.showCustomSnackBar(
      //     variant: SnackbarConfig(backgroundColor: kcSuccessColorBG ) ,
      //     message: "Genial, el cambió fue un éxito",

      //     duration: const Duration(seconds: 2));

      _navigationService.navigateToHomeView();
      rebuildUi();
      return true;
    });
  }

  Future<void> takeAPhoto() async {
    image = await _imagePickerService.takePhoto();
    photo = image?.path;
    rebuildUi();
  }

  Future<bool?> createClient(ClientBody params) async {
    setBusy(true);
    if (!isFormValid) {
      setBusy(false);
      return null;
    }
    final response = await _apiService.createClient(params);

    return response.fold((l) {
      setBusy(false);
      // _snackService.showSnackbar(
      // message: 'No pudimos ',
      // title: 'Ups!',
      // duration: const Duration(seconds: 2));

      return false;
    }, (r) async {
      setBusy(false);
      // _snackService.showSnackbar(
      //     message: "Genial, el cambió fue un éxito",
      //     duration: const Duration(seconds: 2));
      // await _navigationService.navigateToHomeView();

      return true;
    });
  }
}

// import 'package:stacked_services/stacked_services.dart';
// import 'package:flutter/material.dart';

// void setupSnackbarUi() {
//   final service = locator<SnackbarService>();

//   service.registerCustomSnackbarConfig(
//     variant: SnackbarType.success,
//     config: SnackbarConfig(
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//       borderRadius: 8,
//       dismissDirection: DismissDirection.horizontal,
//     ),
//   );

//   service.registerCustomSnackbarConfig(
//     variant: SnackbarType.error,
//     config: SnackbarConfig(
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       borderRadius: 8,
//       dismissDirection: DismissDirection.horizontal,
//     ),
//   );
// }

// enum SnackbarType { success, error }
