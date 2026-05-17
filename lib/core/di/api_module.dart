import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/config/env_config.dart';
import 'package:paiting_by_numbers/features/home/data/api/paintings_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(EnvConfig envConfig) => Dio(
        BaseOptions(
          baseUrl: envConfig.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );

  @lazySingleton
  PaintingsApi getPaintingsApi(Dio dio) => PaintingsApi(dio);
}
