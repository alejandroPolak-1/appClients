import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/models/client_model.dart';
import 'package:tots_stacked_app/api_repository/models/response_create_cliente.dart';
import 'package:tots_stacked_app/api_repository/models/response_update_cliente.dart';
import 'package:tots_stacked_app/api_repository/params/body/client_body.dart';
import 'package:tots_stacked_app/api_repository/params/clients_params.dart';
import 'package:tots_stacked_app/api_repository/params/no_params.dart';
import 'package:tots_stacked_app/api_repository/provider/client_provider.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/clients/get_client_id_use_case.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/use_case_behavior/failure_error.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/use_case_behavior/use_case_behavior.dart';

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

  // Future<List<Client>> getListClient() async {}
  //  Con uses case in repository
  //   GetListClient getListClient = GetListClient();

  //   final response = await getListClient.call(NoParams());

  //   return response.fold(
  //     (error) {
  //       throw error.toString();
  //     },
  //     (client) => client,
  //   );
  // }

  Future<Either<Failure, List<Client>>> getListClient() async {
    final response = UseCaseBehavior.invokeProvider<List<Client>>(
        ClientProvider().getClientList, NoParams());

    return response;
  }

  Future<Either<Failure, ConfirmClientResponse>> updateClient(
      ClientParams params) async {
    // PutEditClienteUseCase getListClient = PutEditClienteUseCase();
    // final response = await getListClient.call(params);

    final response = UseCaseBehavior.invokeProvider<ConfirmClientResponse>(
        ClientProvider().putClientUpdate, params);

    return response;
  }

  Future<Either<Failure, CreateClientResponse>> createClient(
      ClientBody params) async {
    // PostCreateClienteUseCase getListClient = PostCreateClienteUseCase();
    // final response = await getListClient.call(params);
    // return response;

    final response = UseCaseBehavior.invokeProvider<CreateClientResponse>(
        ClientProvider().postClientCreate, params);

    return response;
  }

  Future<Either<Failure, ConfirmClientResponse>> deleteClient(String id) async {
    final response = UseCaseBehavior.invokeProvider<ConfirmClientResponse>(
        ClientProvider().deleteClient, id);

    return response;
  }
}
