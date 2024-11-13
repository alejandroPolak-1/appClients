import 'package:flutter/material.dart';
import 'package:tots_stacked_app/api_repository/api.dart';
import 'package:tots_stacked_app/api_repository/config/config.dart';
import 'package:tots_stacked_app/api_repository/dio_controller.dart';
import 'package:tots_stacked_app/app/app.bottomsheets.dart';
import 'package:tots_stacked_app/app/app.dialogs.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  API.getInstance(DioController(
    baseUrl: Config.baseUrl,
  ));

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
