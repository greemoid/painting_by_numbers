import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paiting_by_numbers/app/app.dart';
import 'package:paiting_by_numbers/app/app_flow/session/session_initializer.dart';
import 'package:paiting_by_numbers/app/registry/feature_registry.dart';
import 'package:paiting_by_numbers/app/router/app_router.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  //todo: set env file name based on flavor mode
  // await dotenv.load(fileName: FlavorConfig.envFile);
  await dotenv.load(fileName: '.env');

  await configureDependencies();

  // SessionInitializer must be called AFTER configureDependencies()
  await locator<SessionInitializer>().call();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final router = AppRouter.create(features: appFeatures);

  runApp(App(router: router));
}
