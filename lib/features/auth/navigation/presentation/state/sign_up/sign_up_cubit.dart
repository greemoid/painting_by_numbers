import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/cubits/base/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_up/sign_up_state.dart';

@injectable
class SignUpCubit extends BaseCubit<SignUpState> {
  final SignUpWithEmailUseCase _signUpWithEmailUseCase;

  SignUpCubit(this._signUpWithEmailUseCase, FailureNotifier failureNotifier)
    : super(const SignUpState.initial(), failureNotifier);

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());
    await execute(
      useCase: () => _signUpWithEmailUseCase(email: email, password: password),
      onSuccess: (user) => emit(SignUpState.success(user)),
      onError: (failure) => emit(SignUpState.failure(failure)),
    );
  }
}
