import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/failures/failure_mapper.dart';
import 'package:paiting_by_numbers/core/utils/logger/app_logger.dart';

mixin RepositoryGuardMixin {
  /// A generic wrapper to handle API calls and error mapping using Either
  Future<Either<Failure, T>> guard<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } catch (e, stackTrace) {
      AppLogger.error(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      return Left(FailureMapper.from(e));
    }
  }
}
