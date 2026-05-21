import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/config/env_reader.dart';

@lazySingleton
class EnvConfig {
  final String baseUrl;

  EnvConfig._({required this.baseUrl});

  @factoryMethod
  factory EnvConfig.fromDotenv() {
    final reader = EnvReader();

    final config = EnvConfig._(baseUrl: reader.require('BASE_URL'));

    reader.validate();
    return config;
  }
}
