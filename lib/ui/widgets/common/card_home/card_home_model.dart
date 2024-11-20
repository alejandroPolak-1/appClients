import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/app/app.dialogs.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/services/client_service.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';

class CardHomeModel extends BaseViewModel {
  final _clientService = locator<ClientService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  showDialogCreateClient({Client? client}) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.dialogForm,
      data: {
        "id": client?.id,
        ksLabelFirstNameClient: client?.firstname,
        ksLabelLastNameClient: client?.lastname,
        ksLabelEmailAdressClient: client?.email,
        'photo': client?.photo,
      },
    );
  }

  void showSuccessMessage() {
    _snackbarService.showSnackbar(
      title: 'Success',
      message: 'The operation was completed successfully!',
    );
  }

  void showErrorMessage() {
    _snackbarService.showSnackbar(
      title: 'Error',
      message: 'Something went wrong, please try again.',
    );
  }

  Future<void> deleteCLient(String id) async {
    var response = await _dialogService.showConfirmationDialog(
        title: deleteClientDialogTitle,
        description: deleteClientDialogMessage,
        confirmationTitle: deleteClientDialogPositiveButton,
        cancelTitle: deleteClientDialogNegativeButton,
        dialogPlatform: DialogPlatform.Cupertino);

    if (response?.confirmed == true) {
      final res = await _clientService.deleteClient(id);
      return res.fold((l) {
        _navigationService.back();
      }, (r) {
        // _snackService.showSnackbar(
        //     message: "Genial, el cambió fue un éxito",
        //     duration: const Duration(seconds: 2));
        //  _navigationService.clearStackAndShowView(const HomeView());
        rebuildUi();
        // return true;
      });
    } else {
      //  _snackService.showSnackbar(
      //     message: "CANCELADO, el cambió fue un éxito",
      //     duration: const Duration(seconds: 2));
    }
  }
}
