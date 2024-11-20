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

  List<Client> listClients = [];
  List<Client> listClientsFetch = [];
  List<Client> listSearchClients = [];

  Future<List<Client>> getClients() async {
    setBusy(true);
    final response = await _clientService.getListClient();
    // rebuildUi();
    return response.fold(
      (error) {
        setBusy(false);
        // rebuildUi();
        throw error.toString();
      },
      (client) {
        setBusy(false);
        listClients = client;
        listClientsFetch = client;
        rebuildUi();
        return client;
      },
    );
  }

  void searchListClient(String search) {
    if (search.length < 3) {
      listClients = listClientsFetch;
      rebuildUi();
    }

    search = search.toLowerCase();
    var searchList = listClientsFetch
        .where((e) =>
            e.firstname!.toLowerCase().contains(search) ||
            e.lastname!.toLowerCase().contains(search))
        .toList();
    rebuildUi();

    listClients = searchList;
    rebuildUi();
  }

  // Future<void> fetchNewClient() async {
  //   await initialise();
  // }

  showDialogCreateClient({Client? client}) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.dialogForm,
      data: {
        ksLabelFirstNameClient: client?.firstname,
        ksLabelLastNameClient: client?.lastname,
        ksLabelEmailAdressClient: client?.email,
        'photo': client?.photo,
      },
    );
  }

  @override
  Future<List<Client>> futureToRun() => getClients();
}
