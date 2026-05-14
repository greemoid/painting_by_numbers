import 'package:dio/dio.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';

class DioErrorMapper {
  static Failure map(Object error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.connectionError) {
        return const NetworkFailure();
      }

      final messageFailure = _mapServerMessageToFailure(error.response);
      if (messageFailure != null) {
        return messageFailure;
      }

      final status = error.response?.statusCode;

      if (status == 401) return const UnauthorizedFailure();
      if (status == 404) return const NotFoundFailure();
      if (status != null && status >= 500) {
        return const ServerFailure();
      }

      return const UnknownFailure();
    }

    return const UnknownFailure();
  }

  static Failure? _mapServerMessageToFailure(Response<dynamic>? response) {
    final data = response?.data;

    if (data is! Map<String, dynamic>) return null;

    final message = data['message'];

    if (message is! String || message.trim().isEmpty) return null;

    final trimmedMessage = message.trim();

    //Map that represents BE error message and corresponding failure
    const serverMessageToFailure = <String, Failure Function()>{};

    final failureFactory = serverMessageToFailure[trimmedMessage];

    if (failureFactory == null) return null;

    return failureFactory();
  }
}
