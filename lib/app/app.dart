import 'package:tots_stacked_app/api_repository/api.dart';
import 'package:tots_stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tots_stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tots_stacked_app/ui/views/home/home_view.dart';
import 'package:tots_stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_stacked_app/ui/views/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/services/api_service.dart';
import 'package:tots_stacked_app/services/client_service.dart';
import 'package:tots_stacked_app/services/secure_storage_service.dart';
import 'package:tots_stacked_app/services/login_service_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ClientService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: LoginServiceService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}