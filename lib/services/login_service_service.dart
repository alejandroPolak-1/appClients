import 'package:dartz/dartz.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

class LoginServiceService {
  Future<Either<Failure, Login>> postLogin(LoginBody loginBody) async {
    PostLoginUseCase postLogin = PostLoginUseCase();

    final response = await postLogin.call(LoginBody(
      email: loginBody.email,
      password: loginBody.password,
    ));

    return response;
  }
}
