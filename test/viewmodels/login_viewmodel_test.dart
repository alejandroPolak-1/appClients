import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:tots_stacked_app/ui/common/_common.dart';
import 'package:tots_stacked_app/ui/views/login/login_view.form.dart';
import 'package:tots_stacked_app/ui/views/login/login_viewmodel.dart';

import '../helpers/test_helpers.dart';

// void main() {
//     LoginViewModel getModel() => LoginViewModel();

//     group('LoginViewModel Tests -', () {
//     setUp(() => registerServices());
//     test('should validate email and password', () async {
//       final vm = getModel();

//       final email = 'invalid_email@example.com';
//       final password = 'invalid_password';

//       // await vm.validateForm(email: email, password: password);
//       // expect(vm.emailError, equals('Invalid email format'));
//       // expect(vm.passwordError, equals('Password must be at least 8 characters long'));
//       // final validEmail = 'valid_email@example.com';
//       // final validPassword = 'valid_password';
//       // await vm.validateForm(email: validEmail, password: validPassword);
//       // expect(vm.emailError, equals(''));
//     });

//     tearDown(() => locator.reset());
//   });
// }

/* import '../helpers/test_helpers.mocks.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
// class MockLoginService extends Mock implements LoginServiceService {}

// class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  LoginViewModel getModel() => LoginViewModel();
  group('LoginViewModel Tests', () {
    late MockLoginServiceService mockLoginService;
    late MockSecureStorageService mockStorageService;
    late MockNavigationService mockNavigationService;
    late MockDialogService mockDialogService;
    late LoginViewModel viewModel;

    setUp(() {
      // Register mocks in the locator
      mockLoginService = getAndRegisterLoginServiceService();
      mockStorageService = getAndRegisterSecureStorageService();
      mockNavigationService = getAndRegisterNavigationService();
      mockDialogService = getAndRegisterDialogService();
      viewModel = getModel();

      // locator.registerSingleton<LoginServiceService>(mockLoginService);
      // locator.registerSingleton<SecureStorageService>(mockStorageService);
      // locator.registerSingleton<MockNavigationService>(mockNavigationService);

      // Initialize the ViewModel
    });

    // tearDown(() {
    //   locator.reset();
    // });

    test('toggle() should invert password visibility', () {
      // Initial state
      expect(viewModel.isObscurePassword, true);

      // Toggle visibility
      viewModel.toggle();
      expect(viewModel.isObscurePassword, false);

      viewModel.toggle();
      expect(viewModel.isObscurePassword, true);
    });

    test('validateForm() should set validation messages for invalid input', () {
      
      // viewModel.fieldsValidationMessages
      
      // mailController.text = "";
      // Mock form inputs
      viewModel.formValueMap[ksLoginLabelMail] = 'invalid-email';
      viewModel.formValueMap[ksLoginLabelPassword] = 'short';

      // Call validateForm
      viewModel.validateForm();

      // Check validation messages
      expect(viewModel.mailValidationMessage, ksErrorInputEmail);
      expect(viewModel.passwordValidationMessage, ksErrorInputPassword);
    });

    // test('login() should call API and save token on success', () async {
    //   const email = 'test@example.com';
    //   const password = 'password123';
    //   const token = 'dummy_token';

    //   // Mock successful login response
    //   when(mockLoginService.postLogin(any))
    //       .thenAnswer((_) async => Right(Login(accessToken: token)));

    //   await viewModel.login(email: email, password: password);

    //   // Verify token is saved
    //   verify(mockStorageService.saveToken(token)).called(1);
    //   expect(viewModel.isLoggedIn, true);
    // });

    test('login() should show error dialog on failure', () async {
      const email = 'test@example.com';
      const password = 'password123';

      // Mock failed login response
      // when(mockLoginService.postLogin(LoginBody(email: email, password: password)))
      //     .thenAnswer((_) async => Failure('Invalid credentials'), ()=> print("ok"));

      await viewModel.login(email: email, password: password);

      // Verify dialog is shown
      // verify(mockDialogService.showDialog(
      //   title: ksErrorTitleLoginRespone,
      //   description: ksErrorDescriptionLoginRespone,
      // )).called(1);

      expect(viewModel.isLoggedIn, false);
    });
  });
}
 */

import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.mocks.dart';
// import 'package:mockito/mockito.dart';

// import 'package:flutter_test/flutter_test.dart';

// import 'package:tots_stacked_app/ui/views/login/login_viewmodel.dart';


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

       final loginBody = LoginBody(email: 'user@tots.agency', password: '123Qwerty');
      final expectedLogin = Login(id: 1, email: 'test@example.com', tokenType: 'Bearer', accessToken: 'mock_access_token');
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

       expect(result, expectedLogin); // Verifica que el objeto creado sea igual al objeto esperado
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
