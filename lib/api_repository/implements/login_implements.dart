import 'package:tots_stacked_app/api_repository/models/login_model.dart';
import 'package:tots_stacked_app/api_repository/params/body/login_body.dart';

abstract class LoginImpl {
  Future<Login> login(LoginBody body);
}
