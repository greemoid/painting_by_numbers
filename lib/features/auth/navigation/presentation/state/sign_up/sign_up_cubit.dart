import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_up/sign_up_state.dart';

@injectable
class SignUpCubit extends BaseCubit<SignUpState> {
  final SignUpWithEmailUseCase _signUpWithEmailUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  SignUpCubit(
    this._signUpWithEmailUseCase,
    this._signInWithGoogleUseCase,
    FailureNotifier failureNotifier,
  ) : super(const SignUpState.initial(), failureNotifier);

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(const SignUpState.loadingEmail());
    await execute(
      useCase: () => _signUpWithEmailUseCase(
        email: email,
        password: password,
        username: username,
      ),
      onSuccess: (user) => safeEmit(SignUpState.success(user)),
      onError: (failure) => safeEmit(SignUpState.failure(failure)),
    );
  }

  Future<void> signUpWithGoogle() async {
    emit(const SignUpState.loadingGoogle());
    await execute(
      useCase: () => _signInWithGoogleUseCase(),
      onSuccess: (user) => safeEmit(SignUpState.success(user)),
      onError: (failure) => safeEmit(SignUpState.failure(failure)),
    );
  }
}
