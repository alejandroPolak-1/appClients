import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('LoginServiceServiceTest -', () {
    late MockLoginServiceService mockLoginService;

    setUp(() {
      registerServices(); // Registra todos los servicios mockeados
      mockLoginService = getAndRegisterLoginServiceService();
    });

    const login = Login(
      id: 1,
      email: 'test@example.com',
      tokenType: 'Bearer',
      accessToken: 'mock_access_token',
    );

    const loginBody = LoginBody(
      email: 'test@example.com',
      password: 'test_password',
    );

    final expectedFailure = Failure(message: "mock error", statusCode: 400);

    test('returns Login object on successful login', () async {
      // Configura el stub para el servicio simulado
      when(mockLoginService.postLogin(any))
          .thenAnswer((response) async => Right(login));

      // Realiza la prueba usando el mock
      final result = await mockLoginService.postLogin(loginBody);

      expect(result.isRight(), true); // Verifica si el resultado es correcto
      expect(result.fold((l) => null, (r) => r),
          login); // Verifica el objeto Login
    });



    test('should return a Failure when login fails', () async {
      // Configura el stub para el servicio simulado
      when(mockLoginService.postLogin(any))
          .thenAnswer((response) async => Left(expectedFailure));

      // Act
      final result = await mockLoginService.postLogin(loginBody);

      // Assert
      expect(result.isLeft(), true); // Verifica si el resultado es un error

      // Verifica que el objeto Failure devuelto sea igual al esperado
      expect(result.fold((l) => l, (r) => null),
          expectedFailure); // Aquí estamos extrayendo el valor de Left
    });

  });
  tearDown(() => locator.reset());
}
