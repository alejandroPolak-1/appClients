import 'package:dio/dio.dart';

class DioController {
  late Dio _httpClient;
  late String _defaultBaseUrl;
  final Map<String, String> headers = {};

  DioController({
    Dio? httpClient,
    String baseUrl = '',
  }) {
    _httpClient = httpClient ?? Dio();
    setBaseUrl(baseUrl);
    _httpClient.options.connectTimeout = const Duration(seconds: 60);
    _httpClient.options.receiveTimeout = const Duration(seconds: 60);
  }

  void setBaseUrl(String aBaseUrl) => _defaultBaseUrl = aBaseUrl;

  String get defaultBaseUrl => _defaultBaseUrl;

  setHttpClient(Dio aHttpClient) => _httpClient = aHttpClient;

  void setHeaders(Map<String, String> customHeaders) =>
      headers.addAll(customHeaders);

  // void setToken(String aToken) => headers["Authorization"] = "Bearer $aToken";

  Future<void> setToken({
    required String accessToken,
    String? refreshToken,
    String tokenType = 'Bearer',
    String contentType = 'application/json',
  }) async {
    setHeaders({'Content-Type': contentType});
    setHeaders({'Authorization': 'Bearer $accessToken'});

  }

  String _baseUrl(String? customBaseUrl) => customBaseUrl ?? _defaultBaseUrl;

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? responseAttributes,
    ResponseType? responseType,
    String? customBaseUrl,
  }) async {
    Response response = await _httpClient.get(
      '${_baseUrl(customBaseUrl)}$endpoint',
      queryParameters: queryParameters,
      options: await getOptions(
          responseAttributes: responseAttributes, responseType: responseType),
    );
    return response;
  }

  Future<Response> post(
    String endpoint,
    dynamic body, {
    String? customBaseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    return await _httpClient.post(
      '${_baseUrl(customBaseUrl)}$endpoint',
      data: body,
      queryParameters: queryParameters,
      options: await getOptions(
        body: body,
        temporalHeaders: customHeaders,
      ),
    );
  }

  Future<Response> postLogin(String endpoint, Object body,
      {String? customBaseUrl, Map<String, dynamic>? customHeaders}) async {
    Response<dynamic> response = await post(
      endpoint,
      body,
      customBaseUrl: customBaseUrl,
      customHeaders: customHeaders,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final accessToken = response.data['access_token'];
      final tokenType = response.data['token_type']; // Si necesitas usar esto
      setToken(
          accessToken: accessToken,
          tokenType: tokenType); // Configura el token en los headers
    }

    return response;
  }

  Future<Response> put(
    String endpoint,
    dynamic body, {
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
  }) async {
    return await _httpClient.put(
      '${_baseUrl(customBaseUrl)}$endpoint',
      data: body,
      queryParameters: queryParameters,
      options: await getOptions(body: body),
    );
  }

  Future<Response> patch(
    String endpoint,
    Object body, {
    String? customBaseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    Response response = await _httpClient.patch(
      '${_baseUrl(customBaseUrl)}$endpoint',
      queryParameters: queryParameters,
      data: body,
      options: await getOptions(body: body, temporalHeaders: customHeaders),
    );

    if (response.statusCode != 200) {
      throw response.data;
    }

    return response;
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
  }) async {
    return await _httpClient.delete(
      '${_baseUrl(customBaseUrl)}$endpoint',
      queryParameters: queryParameters,
      options: await getOptions(),
    );
  }

  Future<Options> getOptions({
    String? responseAttributes,
    ResponseType? responseType,
    Object? body,
    Map<String, dynamic>? temporalHeaders,
  }) async {
    final customHeaders = {
      ...headers,
      ...?temporalHeaders,
    };

    if (responseAttributes != null) {
      customHeaders[responseAttributes.contains(',')
          ? "responseAttributes"
          : "expressionata"] = responseAttributes;
    }

    return Options(responseType: responseType, headers: customHeaders);
  }
}
