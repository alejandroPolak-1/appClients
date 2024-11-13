import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tots_stacked_app/api_repository/uses_cases/use_case_behavior/failure_error.dart';

class UseCaseBehavior {
  static Future<Either<Failure, T>> invokeProvider<T>(
    function,
    params, {
    endpoint,
    adapterModel,
  }) async {
    try {
      final result = endpoint == null
          ? await function(params)
          : await function(params, endpoint: endpoint);

      final adaptedResult =
          adapterModel != null ? adapterModel(result) : result;

      return Right(adaptedResult);
    } catch (e) {
      return Left(Failure(message: e.toString(), statusCode: e.hashCode));
    }
  }

  static Response copyResponse(Response response, {dynamic data}) => Response(
        data: data ?? response.data,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
        headers: response.headers,
      );
}
