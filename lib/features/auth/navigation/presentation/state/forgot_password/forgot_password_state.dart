import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.success() = _Success;
  const factory ForgotPasswordState.failure(Failure failure) = _Failure;
}
