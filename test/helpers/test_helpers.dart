import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/services/client_service.dart';
import 'package:tots_stacked_app/services/secure_storage_service.dart';
import 'package:tots_stacked_app/services/login_service_service.dart';
import 'package:tots_stacked_app/services/image_picker_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginServiceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ImagePickerService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterClientService();
  getAndRegisterSecureStorageService();
  getAndRegisterLoginServiceService();
  getAndRegisterImagePickerService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockSecureStorageService getAndRegisterSecureStorageService() {
  _removeRegistrationIfExists<SecureStorageService>();
  final service = MockSecureStorageService();
  locator.registerSingleton<SecureStorageService>(service);
  return service;
}

MockLoginServiceService getAndRegisterLoginServiceService() {
  _removeRegistrationIfExists<LoginServiceService>();
  final service = MockLoginServiceService();
  locator.registerSingleton<LoginServiceService>(service);
  return service;
}

MockImagePickerService getAndRegisterImagePickerService() {
  _removeRegistrationIfExists<ImagePickerService>();
  final service = MockImagePickerService();
  locator.registerSingleton<ImagePickerService>(service);
  return service;
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
