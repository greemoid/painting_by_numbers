import 'dart:developer' as developer;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paiting_by_numbers/app/app.dart';
import 'package:paiting_by_numbers/app/app_flow/session/session_initializer.dart';
import 'package:paiting_by_numbers/app/registry/feature_registry.dart';
import 'package:paiting_by_numbers/app/router/app_router.dart';
import 'package:paiting_by_numbers/app/ui/bootstrap_error_app.dart';
import 'package:paiting_by_numbers/core/config/env_config.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/native/rust/frb_generated.dart';
import 'package:paiting_by_numbers/firebase_options.dart';

Future<void> bootstrap() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await GoogleSignIn.instance.initialize();
    await RustLib.init();

    await dotenv.load(fileName: '.env');

    await configureDependencies();
    locator<EnvConfig>();

    await locator<SessionInitializer>().call();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final router = AppRouter.create(features: appFeatures);

    runApp(App(router: router));
  } catch (error, stackTrace) {
    developer.log(
      'Fatal error during bootstrap',
      error: error,
      stackTrace: stackTrace,
    );

    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'App Bootstrap',
        context: ErrorDescription('during app bootstrap initialization'),
      ),
    );

    runApp(BootstrapErrorApp(error: error));
  }
}
