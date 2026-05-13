import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/di/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => locator.init();
