import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/mappers/dio_error_mapper.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/core/utils/logger/app_logger.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState, this._failureNotifier);

  final FailureNotifier _failureNotifier;

  Future<void> execute<T>({
    bool showSnackBarOnError = true,
    required Future<Either<Failure, T>> Function() useCase,
    required FutureOr<void> Function(T data) onSuccess,
    FutureOr<void> Function(Failure failure)? onError,
    FutureOr<void> Function()? onStart,
    FutureOr<void> Function()? onComplete,
  }) async {
    try {
      await onStart?.call();
      final result = await useCase();
      switch (result) {
        case Left(:final value):
          await _handleFailure(value, onError, showSnackBarOnError);
        case Right(:final value):
          await onSuccess(value);
      }
    } catch (error, stackTrace) {
      AppLogger.error(
        'Unhandled exception in useCase',
        tag: runtimeType.toString(),
        error: error,
        stackTrace: stackTrace,
      );
      await _handleFailure(
        DioErrorMapper.map(error),
        onError,
        showSnackBarOnError,
      );
    } finally {
      await onComplete?.call();
    }
  }

  Future<void> _handleFailure(
    Failure failure,
    FutureOr<void> Function(Failure)? onError,
    bool notify,
  ) async {
    if (isClosed) return;
    if (notify) _failureNotifier.notify(failure);
    await onError?.call(failure);
  }

  void safeEmit(State state) {
    if (!isClosed) emit(state);
  }
}
