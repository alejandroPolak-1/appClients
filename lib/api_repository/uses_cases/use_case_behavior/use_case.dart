import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/use_case_behavior/failure_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}
