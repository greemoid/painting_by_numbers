import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success(UserEntity user) = _Success;
  const factory SignInState.failure(Failure failure) = _Failure;
}
