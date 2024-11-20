import 'package:tots_stacked_app/api_repository/models/client_model.dart';
import 'package:tots_stacked_app/api_repository/models/response_create_cliente.dart';
import 'package:tots_stacked_app/api_repository/models/response_update_cliente.dart';
import 'package:tots_stacked_app/api_repository/params/body/client_body.dart';
import 'package:tots_stacked_app/api_repository/params/clients_params.dart';
import 'package:tots_stacked_app/api_repository/params/no_params.dart';

abstract class ClientImpl {
  Future<List<Client>> getClientList(NoParams params);
  Future<Client> getClientId(String id);
  Future<CreateClientResponse> postClientCreate(ClientBody body);
  Future<ConfirmClientResponse> putClientUpdate(ClientParams params);
  Future<ConfirmClientResponse> deleteClient(String id);
}

//RESPUESTA INCORRECTA
// {
//     "statusCode": 500,
//     "message": "Endpoint not found"
// }

// delete correcto:ArgumentError
// {
//     "success": true
// }
