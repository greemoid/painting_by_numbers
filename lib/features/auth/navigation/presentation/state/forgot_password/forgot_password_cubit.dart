import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/send_password_reset_link_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/forgot_password/forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState> {
  final SendPasswordResetLinkUseCase _sendPasswordResetLinkUseCase;

  ForgotPasswordCubit(
    this._sendPasswordResetLinkUseCase,
    FailureNotifier failureNotifier,
  ) : super(const ForgotPasswordState.initial(), failureNotifier);

  Future<void> sendResetLink({required String email}) async {
    emit(const ForgotPasswordState.loading());
    await execute(
      useCase: () => _sendPasswordResetLinkUseCase(email: email),
      onSuccess: (_) => emit(const ForgotPasswordState.success()),
      onError: (failure) => emit(ForgotPasswordState.failure(failure)),
    );
  }
}
