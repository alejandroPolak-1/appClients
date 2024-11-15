import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/app/app.dialogs.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/services/client_service.dart';

import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';

import '../../../api_repository/_api_repository.dart';

class HomeViewModel extends FutureViewModel<List<Client>> with FormStateHelper {
  final _clientService = locator<ClientService>();
  final _dialogService = locator<DialogService>();

  Future<List<Client>> getClients() async {
    final response = await _clientService.getListClient();

    return response;
  }

  Future<void> fetchNewClient() async {
    await initialise();
  }

  showDialogEditClient(Client client) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.dialogForm,
      // title: 'Stacked Rocks!',
      // description: 'Give stacked ${client.lastname} stars on Github',
      data: {
        ksLabelFirstNameClient: client.firstname,
        ksLabelLastNameClient: client.lastname,
        ksLabelEmailAdressClient: client.email,
        'photo': client.photo,
      },
    );
  }

  @override
  Future<List<Client>> futureToRun() => getClients();
}
