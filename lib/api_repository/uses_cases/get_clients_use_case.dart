import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/api_repository/params/no_params.dart';

class GetListClient implements UseCase<List<Client>, NoParams> {
  @override
  Future<Either<Failure, List<Client>>> call(params) async =>
      UseCaseBehavior.invokeProvider<List<Client>>(
          ClientProvider().getClientList, params);
}
