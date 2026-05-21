import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/config/env_config.dart';
import 'package:paiting_by_numbers/core/services/network/interceptors/logging_interceptor.dart';
import 'package:paiting_by_numbers/features/home/data/api/paintings_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(EnvConfig envConfig) {
    final dio = Dio(
      BaseOptions(
        baseUrl: envConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(getLoggingInterceptor());
    return dio;
  }

  @lazySingleton
  PaintingsApi getPaintingsApi(Dio dio) => PaintingsApi(dio);
}
