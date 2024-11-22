
import 'package:flutter_test/flutter_test.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

import 'package:tots_stacked_app/ui/common/_common.dart';
import 'package:tots_stacked_app/ui/views/login/login_view.form.dart';
import 'package:tots_stacked_app/ui/views/login/login_viewmodel.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';


void main() {
  late LoginViewModel viewModel;
  late MockLoginServiceService mockLoginService;
  late MockDialogService mockDialogService;
  late MockNavigationService mockNavigationService;

  setUp(() {
    registerServices(); // Registra todos los servicios mockeados
    mockLoginService = getAndRegisterLoginServiceService();
    mockDialogService = getAndRegisterDialogService();
    mockNavigationService = getAndRegisterNavigationService();

    viewModel = LoginViewModel();
  });

  group('LoginViewModel Tests', () {
    final loginBody =
        LoginBody(email: 'user@tots.agency', password: '123Qwerty');
    final expectedLogin = Login(
        id: 1,
        email: 'test@example.com',
        tokenType: 'Bearer',
        accessToken: 'mock_access_token');
    test('should validate email correctly', () {
      viewModel.formValueMap[ksLoginLabelMail] = 'test@example.com';
      viewModel.validateForm();
      expect(viewModel.mailValidationMessage,
          isNull); // No debería haber mensaje de error
    });

    test('should show error for invalid email', () {
      viewModel.formValueMap[ksLoginLabelMail] = 'invalid_email';
      viewModel.validateForm();
      expect(viewModel.mailValidationMessage,
          isNotNull); // Debería haber un mensaje de error
    });

    test('Test MODEL should create a Login object from JSON', () {
      // Simula una respuesta exitosa del servicio

      final jsonMap = {
        'id': 1,
        'email': 'test@example.com',
        'token_type': 'Bearer',
        'access_token': 'mock_access_token',
      };

      final result = Login.fromJson(jsonMap);

      expect(result,
          expectedLogin); // Verifica que el objeto creado sea igual al objeto esperado
    });

    test('Test Model should convert a Login object to JSON', () {
      // Act
      final result = expectedLogin.toJson();

      // Assert
      expect(result, {
        'id': 1,
        'email': 'test@example.com',
        'token_type': 'Bearer', // Asegúrate de que este valor sea correcto
        'access_token': 'mock_access_token',
      }); // Verifica que el mapa generado sea correcto
    });

    test('should toggle password visibility', () {
      expect(viewModel.isObscurePassword,
          isTrue); // Inicialmente debería ser verdadero

      viewModel.toggle(); // Cambia la visibilidad

      expect(viewModel.isObscurePassword, isFalse); // Ahora debería ser falso
    });
  });
}
