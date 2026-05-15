import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/reload_user_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/send_email_verification_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/verify_email/verify_email_state.dart';

@injectable
class VerifyEmailCubit extends BaseCubit<VerifyEmailState> {
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;
  final ReloadUserUseCase _reloadUserUseCase;

  VerifyEmailCubit(
    this._sendEmailVerificationUseCase,
    this._reloadUserUseCase,
    FailureNotifier failureNotifier,
  ) : super(const VerifyEmailState.initial(), failureNotifier);

  Future<void> sendVerificationEmail() async {
    emit(const VerifyEmailState.loadingResend());
    await execute(
      useCase: () => _sendEmailVerificationUseCase(),
      onSuccess: (_) => emit(const VerifyEmailState.success()),
      onError: (failure) => emit(VerifyEmailState.failure(failure)),
    );
  }

  Future<void> reloadUser({bool isManual = false}) async {
    if (isManual) {
      emit(const VerifyEmailState.loadingManual());
    }

    await execute(
      useCase: () => _reloadUserUseCase(),
      onSuccess: (_) {
        if (isManual) {
          emit(const VerifyEmailState.initial());
        }
      },
      onError: (failure) {
        if (isManual) {
          emit(VerifyEmailState.failure(failure));
        }
      },
    );
  }
}
