// Mocks generated by Mockito 5.4.4 from annotations
// in tots_stacked_app/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i10;

import 'package:dartz/dartz.dart' as _i3;
import 'package:encrypt/encrypt.dart' as _i5;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:image_picker/image_picker.dart' as _i21;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:tots_stacked_app/api_repository/_api_repository.dart' as _i19;
import 'package:tots_stacked_app/api_repository/models/client_model.dart'
    as _i2;
import 'package:tots_stacked_app/api_repository/models/response_create_cliente.dart'
    as _i15;
import 'package:tots_stacked_app/api_repository/models/response_update_cliente.dart'
    as _i13;
import 'package:tots_stacked_app/api_repository/params/body/client_body.dart'
    as _i16;
import 'package:tots_stacked_app/api_repository/params/clients_params.dart'
    as _i14;
import 'package:tots_stacked_app/api_repository/uses_cases/use_case_behavior/failure_error.dart'
    as _i12;
import 'package:tots_stacked_app/services/client_service.dart' as _i11;
import 'package:tots_stacked_app/services/image_picker_service.dart' as _i20;
import 'package:tots_stacked_app/services/login_service_service.dart' as _i18;
import 'package:tots_stacked_app/services/secure_storage_service.dart' as _i17;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFlutterSecureStorage_2 extends _i1.SmartFake
    implements _i4.FlutterSecureStorage {
  _FakeFlutterSecureStorage_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEncrypter_3 extends _i1.SmartFake implements _i5.Encrypter {
  _FakeEncrypter_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIV_4 extends _i1.SmartFake implements _i5.IV {
  _FakeIV_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i6.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
      ) as String);

  @override
  _i8.GlobalKey<_i8.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i8.GlobalKey<_i8.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i6.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<T?>? navigateWithTransition<T>(
    _i8.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i8.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? replaceWithTransition<T>(
    _i8.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i8.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i8.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i8.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? navigateToView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i8.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i6.Transition? transition,
    _i6.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i8.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? clearStackAndShowView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? clearTillFirstAndShowView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);

  @override
  _i9.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i8.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i6.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i6.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<_i6.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i9.Future<_i6.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i6.SheetResponse<dynamic>?>.value(),
      ) as _i9.Future<_i6.SheetResponse<dynamic>?>);

  @override
  _i9.Future<_i6.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i10.Color? barrierColor = const _i10.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i9.Future<_i6.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i9.Future<_i6.SheetResponse<T>?>.value(),
      ) as _i9.Future<_i6.SheetResponse<T>?>);

  @override
  void completeSheet(_i6.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i6.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i6.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i8.Widget Function(
      _i8.BuildContext,
      _i6.DialogRequest<dynamic>,
      dynamic Function(_i6.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<_i6.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i10.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i10.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i8.RouteSettings? routeSettings,
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i9.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i9.Future<_i6.DialogResponse<dynamic>?>);

  @override
  _i9.Future<_i6.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i10.Color? barrierColor = const _i10.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    _i8.RouteSettings? routeSettings,
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    _i8.RouteTransitionsBuilder? transitionBuilder,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #transitionBuilder: transitionBuilder,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i9.Future<_i6.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i9.Future<_i6.DialogResponse<T>?>.value(),
      ) as _i9.Future<_i6.DialogResponse<T>?>);

  @override
  _i9.Future<_i6.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i10.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i10.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i8.RouteSettings? routeSettings,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i9.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i9.Future<_i6.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i6.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ClientService].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientService extends _i1.Mock implements _i11.ClientService {
  @override
  _i9.Future<_i2.Client> getClientId(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getClientId,
          [id],
        ),
        returnValue: _i9.Future<_i2.Client>.value(_FakeClient_0(
          this,
          Invocation.method(
            #getClientId,
            [id],
          ),
        )),
        returnValueForMissingStub: _i9.Future<_i2.Client>.value(_FakeClient_0(
          this,
          Invocation.method(
            #getClientId,
            [id],
          ),
        )),
      ) as _i9.Future<_i2.Client>);

  @override
  _i9.Future<_i3.Either<_i12.Failure, List<_i2.Client>>> getListClient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListClient,
          [],
        ),
        returnValue:
            _i9.Future<_i3.Either<_i12.Failure, List<_i2.Client>>>.value(
                _FakeEither_1<_i12.Failure, List<_i2.Client>>(
          this,
          Invocation.method(
            #getListClient,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i9.Future<_i3.Either<_i12.Failure, List<_i2.Client>>>.value(
                _FakeEither_1<_i12.Failure, List<_i2.Client>>(
          this,
          Invocation.method(
            #getListClient,
            [],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i12.Failure, List<_i2.Client>>>);

  @override
  _i9.Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>> updateClient(
          _i14.ClientParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateClient,
          [params],
        ),
        returnValue: _i9
            .Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i13.ConfirmClientResponse>(
          this,
          Invocation.method(
            #updateClient,
            [params],
          ),
        )),
        returnValueForMissingStub: _i9
            .Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i13.ConfirmClientResponse>(
          this,
          Invocation.method(
            #updateClient,
            [params],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>);

  @override
  _i9.Future<_i3.Either<_i12.Failure, _i15.CreateClientResponse>> createClient(
          _i16.ClientBody? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #createClient,
          [params],
        ),
        returnValue: _i9
            .Future<_i3.Either<_i12.Failure, _i15.CreateClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i15.CreateClientResponse>(
          this,
          Invocation.method(
            #createClient,
            [params],
          ),
        )),
        returnValueForMissingStub: _i9
            .Future<_i3.Either<_i12.Failure, _i15.CreateClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i15.CreateClientResponse>(
          this,
          Invocation.method(
            #createClient,
            [params],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i12.Failure, _i15.CreateClientResponse>>);

  @override
  _i9.Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>> deleteClient(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteClient,
          [id],
        ),
        returnValue: _i9
            .Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i13.ConfirmClientResponse>(
          this,
          Invocation.method(
            #deleteClient,
            [id],
          ),
        )),
        returnValueForMissingStub: _i9
            .Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>.value(
            _FakeEither_1<_i12.Failure, _i13.ConfirmClientResponse>(
          this,
          Invocation.method(
            #deleteClient,
            [id],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i12.Failure, _i13.ConfirmClientResponse>>);
}

/// A class which mocks [SecureStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageService extends _i1.Mock
    implements _i17.SecureStorageService {
  @override
  _i4.FlutterSecureStorage get storage => (super.noSuchMethod(
        Invocation.getter(#storage),
        returnValue: _FakeFlutterSecureStorage_2(
          this,
          Invocation.getter(#storage),
        ),
        returnValueForMissingStub: _FakeFlutterSecureStorage_2(
          this,
          Invocation.getter(#storage),
        ),
      ) as _i4.FlutterSecureStorage);

  @override
  _i5.Encrypter get encrypter => (super.noSuchMethod(
        Invocation.getter(#encrypter),
        returnValue: _FakeEncrypter_3(
          this,
          Invocation.getter(#encrypter),
        ),
        returnValueForMissingStub: _FakeEncrypter_3(
          this,
          Invocation.getter(#encrypter),
        ),
      ) as _i5.Encrypter);

  @override
  _i5.IV get iv => (super.noSuchMethod(
        Invocation.getter(#iv),
        returnValue: _FakeIV_4(
          this,
          Invocation.getter(#iv),
        ),
        returnValueForMissingStub: _FakeIV_4(
          this,
          Invocation.getter(#iv),
        ),
      ) as _i5.IV);

  @override
  _i9.Future<void> saveToken(String? accessToken) => (super.noSuchMethod(
        Invocation.method(
          #saveToken,
          [accessToken],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<String?> getToken() => (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
        returnValueForMissingStub: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);

  @override
  _i9.Future<void> removeToken() => (super.noSuchMethod(
        Invocation.method(
          #removeToken,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<String> write(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [
            key,
            value,
          ],
        ),
        returnValue: _i9.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #write,
            [
              key,
              value,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i9.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #write,
            [
              key,
              value,
            ],
          ),
        )),
      ) as _i9.Future<String>);

  @override
  _i9.Future<String> getValue(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getValue,
          [key],
        ),
        returnValue: _i9.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #getValue,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i9.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #getValue,
            [key],
          ),
        )),
      ) as _i9.Future<String>);

  @override
  _i9.Future<void> deleteValue(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteValue,
          [key],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [LoginServiceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginServiceService extends _i1.Mock
    implements _i18.LoginServiceService {
  @override
  _i9.Future<_i3.Either<_i12.Failure, _i19.Login>> postLogin(
          _i19.LoginBody? loginBody) =>
      (super.noSuchMethod(
        Invocation.method(
          #postLogin,
          [loginBody],
        ),
        returnValue: _i9.Future<_i3.Either<_i12.Failure, _i19.Login>>.value(
            _FakeEither_1<_i12.Failure, _i19.Login>(
          this,
          Invocation.method(
            #postLogin,
            [loginBody],
          ),
        )),
        returnValueForMissingStub:
            _i9.Future<_i3.Either<_i12.Failure, _i19.Login>>.value(
                _FakeEither_1<_i12.Failure, _i19.Login>(
          this,
          Invocation.method(
            #postLogin,
            [loginBody],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i12.Failure, _i19.Login>>);
}

/// A class which mocks [ImagePickerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePickerService extends _i1.Mock
    implements _i20.ImagePickerService {
  @override
  _i9.Future<_i21.XFile?> pickImageFromGallery() => (super.noSuchMethod(
        Invocation.method(
          #pickImageFromGallery,
          [],
        ),
        returnValue: _i9.Future<_i21.XFile?>.value(),
        returnValueForMissingStub: _i9.Future<_i21.XFile?>.value(),
      ) as _i9.Future<_i21.XFile?>);

  @override
  _i9.Future<_i21.XFile?> takePhoto() => (super.noSuchMethod(
        Invocation.method(
          #takePhoto,
          [],
        ),
        returnValue: _i9.Future<_i21.XFile?>.value(),
        returnValueForMissingStub: _i9.Future<_i21.XFile?>.value(),
      ) as _i9.Future<_i21.XFile?>);

  @override
  _i9.Future<_i21.XFile?> pickVideoFromGallery() => (super.noSuchMethod(
        Invocation.method(
          #pickVideoFromGallery,
          [],
        ),
        returnValue: _i9.Future<_i21.XFile?>.value(),
        returnValueForMissingStub: _i9.Future<_i21.XFile?>.value(),
      ) as _i9.Future<_i21.XFile?>);

  @override
  _i9.Future<_i21.XFile?> recordVideo() => (super.noSuchMethod(
        Invocation.method(
          #recordVideo,
          [],
        ),
        returnValue: _i9.Future<_i21.XFile?>.value(),
        returnValueForMissingStub: _i9.Future<_i21.XFile?>.value(),
      ) as _i9.Future<_i21.XFile?>);
}
