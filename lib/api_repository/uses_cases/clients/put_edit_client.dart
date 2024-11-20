import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/api_repository/models/response_update_cliente.dart';

class PutEditClienteUseCase
    implements UseCase<ConfirmClientResponse, ClientParams> {
  @override
  Future<Either<Failure, ConfirmClientResponse>> call(params) async =>
      UseCaseBehavior.invokeProvider<ConfirmClientResponse>(
          ClientProvider().putClientUpdate, params);
}
