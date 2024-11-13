import 'package:dio/dio.dart';
import 'package:tots_stacked_app/api_repository/dio_controller.dart';

class API {
  static late API _instance;
  static bool _initialized = false;
  late DioController _httpController;
  

  API._();

  static API getInstance([DioController? httpController]) {
    if (!_initialized) {
      _instance = API._();
      _instance._httpController =
          httpController ?? (throw Exception('httpController is required'));
      _initialized = true;
    }
    return _instance;
  }

  String get defaultBaseUrl => _httpController.defaultBaseUrl;
  Map<String, String> get headers => _httpController.headers;

  void setHttpClient(Dio httpClient) =>
      _httpController.setHttpClient(httpClient);



  void setHeaders(Map<String, String> headers) =>
      _httpController.setHeaders(headers);

  // void setToken(String token) {
  //   _httpController.setHeaders({'Authorization': 'Bearer $token'});
  // }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? responseAttributes,
    ResponseType? responseType,
    String? customBaseUrl,
  }) async =>
      await _httpController.get(endpoint,
          queryParameters: queryParameters,
          responseAttributes: responseAttributes,
          responseType: responseType,
          customBaseUrl: customBaseUrl);

  Future<Response> patch(
    String endpoint,
    Object body, {
    String? customBaseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async =>
      await _httpController.patch(endpoint, body,
          customBaseUrl: customBaseUrl, queryParameters: queryParameters);

  Future<Response> post(
    String endpoint,
    Object body, {
    String? customBaseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async =>
      await _httpController.post(endpoint, body,
          customBaseUrl: customBaseUrl, queryParameters: queryParameters);

  Future<Response> postLogin(
    String endpoint,
    Object body, {
    String? customBaseUrl,
    Map<String, dynamic>? customHeaders,
  }) async =>
      await _httpController.postLogin(
        endpoint,
        body,
        customBaseUrl: customBaseUrl,
        customHeaders: customHeaders,
      );

  Future<Response> put(
    String endpoint,
    Object body, {
    String? customBaseUrl,
  }) async =>
      await _httpController.put(endpoint, body, customBaseUrl: customBaseUrl);

  Future<Response> delete(
    String endpoint, {
    String? customBaseUrl,
  }) async =>
      await _httpController.delete(endpoint, customBaseUrl: customBaseUrl);
}
