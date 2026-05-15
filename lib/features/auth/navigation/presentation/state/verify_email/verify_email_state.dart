import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';

part 'verify_email_state.freezed.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;
  const factory VerifyEmailState.loadingResend() = _LoadingResend;
  const factory VerifyEmailState.loadingManual() = _LoadingManual;
  const factory VerifyEmailState.success() = _Success;
  const factory VerifyEmailState.failure(Failure failure) = _Failure;
}
