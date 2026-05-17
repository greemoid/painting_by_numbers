import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/features/home/data/api/paintings_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://openaccess-api.clevelandart.org/api/',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );

  @lazySingleton
  PaintingsApi getPaintingsApi(Dio dio) => PaintingsApi(dio);
}
