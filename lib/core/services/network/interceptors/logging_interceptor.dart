import 'package:pretty_dio_logger/pretty_dio_logger.dart';

PrettyDioLogger getLoggingInterceptor() => PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: false,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: 90,
);
