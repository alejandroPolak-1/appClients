import 'package:tots_stacked_app/api_repository/models/client_model.dart';
import 'package:tots_stacked_app/api_repository/params/no_params.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/get_client_id_use_case.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/get_clients_use_case.dart';

class ClientService {
  Future<Client> getClientId(String id) async {
    GetClient getClient = GetClient();

    final response = await getClient.call(id);

    return response.fold(
      (error) {
        throw error.toString();
      },
      (client) => client,
    );
  }

  Future<List<Client>> getListClient() async {
    GetListClient getListClient = GetListClient();

    final response = await getListClient.call(NoParams());

    return response.fold(
      (error) {
        throw error.toString();
      },
      (client) => client,
    );
  }
}
