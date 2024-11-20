import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

class GetClient implements UseCase<Client, String> {
  @override
  Future<Either<Failure, Client>> call(params) async =>
      UseCaseBehavior.invokeProvider<Client>(
          ClientProvider().getClientId, params);
}
