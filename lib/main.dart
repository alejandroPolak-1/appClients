import 'package:flutter/material.dart';
import 'package:tots_stacked_app/api_repository/api.dart';
import 'package:tots_stacked_app/api_repository/config/config.dart';
import 'package:tots_stacked_app/api_repository/dio_controller.dart';
import 'package:tots_stacked_app/app/app.bottomsheets.dart';
import 'package:tots_stacked_app/app/app.dialogs.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/services/secure_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  String? tokens = await SecureStorageService().getToken();

  API.getInstance(DioController(
    baseUrl: Config.baseUrl,
  ));

  API.getInstance().setToken(tokens);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
