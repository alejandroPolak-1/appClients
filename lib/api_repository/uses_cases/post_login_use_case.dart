import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

class PostLoginUseCase implements UseCase<Login, LoginBody> {
  @override
  Future<Either<Failure, Login>> call(params) async =>
      UseCaseBehavior.invokeProvider<Login>(LoginProvider().login, params);
}
