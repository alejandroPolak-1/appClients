import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/api_repository/models/response_create_cliente.dart';

class PostCreateClienteUseCase
    implements UseCase<CreateClientResponse, ClientParams> {
  @override
  Future<Either<Failure, CreateClientResponse>> call(params) async =>
      UseCaseBehavior.invokeProvider<CreateClientResponse>(
          ClientProvider().postClientCreate, params);
}
