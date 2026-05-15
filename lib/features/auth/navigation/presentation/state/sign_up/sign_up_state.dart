import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loadingEmail() = _LoadingEmail;
  const factory SignUpState.loadingGoogle() = _LoadingGoogle;
  const factory SignUpState.success(UserEntity user) = _Success;
  const factory SignUpState.failure(Failure failure) = _Failure;
}
