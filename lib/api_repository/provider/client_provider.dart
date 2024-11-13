import 'package:dio/dio.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/api_repository/params/no_params.dart';

class ClientProvider implements ClientImpl {
  List<Client> clientFromBody(List<dynamic> jsonMap) {
    return List<Client>.from(jsonMap.map((e) => Client.fromJson(e)).toList());
  }

  @override
  Future<String> deleteClient(String id) async {
    Response response = await API.getInstance().delete(
          ClientEndpoints.deleteClient.replaceAll(':id', id),
        );

    return response.data;
  }

  @override
  Future<Client> getClientId(String id) async {
    Response response = await API.getInstance().get(
          ClientEndpoints.getClientById.replaceAll(':id', id),
        );

    return Client.fromJson(response.data);
  }

  @override
  Future<List<Client>> getClientList(NoParams params) async {
    Response response = await API.getInstance().get(
          ClientEndpoints.getClients,
        );

    return clientFromBody(response.data["data"]);
  }

  @override
  Future<String> postClientCreate(ClientBody body) async {
    Response response = await API
        .getInstance()
        .post(ClientEndpoints.postCreateClient, body.toMap());

    return response.data;
  }

  @override
  Future<String> putClientUpdate(ClientParams params) async {
    Response response = await API.getInstance().put(
        ClientEndpoints.putUpdateClient.replaceAll(':id', params.id),
        params.body.toMap());

    return response.data;
  }
}
