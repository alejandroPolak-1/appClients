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

  final ScrollController scrollController = ScrollController();

  List<Client> listClientsFetchAPi = [];
  List<Client> listClientsLoad = [];
  List<Client> listClientsSaveToLoad = [];

  int currentLoadLast = 0; // Contador para cuántos elementos hemos cargado
  int currentLoadCount = 0; // Contador para cuántos elementos hemos cargado

  Future<List<Client>> getClients() async {
    setBusy(true);
    final response = await _clientService.getListClient();
    return response.fold(
      (error) {
        setBusy(false);
        throw error.toString();
      },
      (client) {
        client.sort((a, b) => b.updated!.compareTo(a.updated!));

        listClientsFetchAPi = client;
        listClientsSaveToLoad = client;
        showLastClients(5);

        return client;
      },
    );
  }

  void searchListClient(String search) {
    if (search.length < 3) {
      listClientsLoad = listClientsSaveToLoad;
      rebuildUi();
    }

    search = search.toLowerCase();
    var searchList = listClientsLoad
        .where((e) =>
            e.firstname!.toLowerCase().contains(search) ||
            e.lastname!.toLowerCase().contains(search))
        .toList();
    rebuildUi();

    listClientsLoad = searchList;
    rebuildUi();
  }

  void showLastClients(int increment) {
    setBusy(true);
    // Aumenta el contador en el incremento especificado
    currentLoadCount += increment;

    // Asegúrate de no exceder el tamaño de la lista
    if (currentLoadCount > listClientsFetchAPi.length) {
      currentLoadCount = listClientsFetchAPi.length;
    }

    // Devuelve los últimos clientes según el contador actual
    var listToInsert =
        listClientsFetchAPi.sublist(currentLoadLast, currentLoadCount);
    listClientsLoad.addAll(listToInsert);

    listClientsLoad.sort((a, b) => b.updated!.compareTo(a.updated!));

    currentLoadLast += increment;
    Future.delayed(const Duration(seconds: 2), () {
      rebuildUi();
      setBusy(false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          currentLoadLast == increment
              ? scrollController.position.minScrollExtent
              // Desplazarse al final después de agregar
              : scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

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
