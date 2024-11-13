
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/services/client_service.dart';

import 'package:stacked/stacked.dart';

import '../../../api_repository/_api_repository.dart';

class HomeViewModel extends FutureViewModel<List<Client>> with FormStateHelper {

  final _clientService = locator<ClientService>();

  Future<List<Client>> getClients() async {
    final response = await _clientService.getListClient();

    return response;
  }

  Future<void> fetchNewClient() async {
    await initialise();
  }

  @override
  Future<List<Client>> futureToRun() => getClients();

  
}
