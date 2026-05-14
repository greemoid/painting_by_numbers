import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success(UserEntity user) = _Success;
  const factory SignUpState.failure(Failure failure) = _Failure;
}
