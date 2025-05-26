import 'dart:async';
import 'package:common/common.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fcm_service.dart';
import '../../firebase_options.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../local/config_preference.dart';
import 'dependencies.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    BaseLogger.info('onChange(${bloc.runtimeType}, $change)');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    BaseLogger.info('onError(${bloc.runtimeType},');
    super.onError(bloc, error, stackTrace);
  }
}

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        BaseLogger.error(error.toString());
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Initialize notification service
    await NotificationService().initialize();

    await Helpers.loadImage(const AssetImage(AppConstants.businessProfileImg));

    Bloc.observer = AppBlocObserver();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      BaseLogger.error(details.toString());
    };

    _productEnvironmentWithContainer();

    // await ProductStateItems.productCache.init();
    // Depedency initialize
    // envied
    await DependencyManager.inject();
    final pref = await SharedPreferences.getInstance();
    ConfigPreference.init(pref);
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    // AppEnvironment.general();
    // AppEnvironment.general();

    /// It must be call after [AppEnvironment.general()]

    // ProductContainer.setup();
  }
}
