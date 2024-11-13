import 'package:dio/dio.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

class LoginProvider implements LoginImpl {
  @override
  Future<Login> login(LoginBody body) async {
    Response response = await API
        .getInstance()
        .postLogin(LoginEndpoints.postLogin, body.toMap());

    return Login.fromJson(response.data);
  }
}
