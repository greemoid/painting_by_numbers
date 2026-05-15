import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_in/sign_in_state.dart';

@injectable
class SignInCubit extends BaseCubit<SignInState> {
  final SignInWithEmailUseCase _signInWithEmailUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  SignInCubit(
    this._signInWithEmailUseCase,
    this._signInWithGoogleUseCase,
    FailureNotifier failureNotifier,
  ) : super(const SignInState.initial(), failureNotifier);

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(const SignInState.loadingEmail());
    await execute(
      useCase: () => _signInWithEmailUseCase(email: email, password: password),
      onSuccess: (user) => safeEmit(SignInState.success(user)),
      onError: (failure) => safeEmit(SignInState.failure(failure)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const SignInState.loadingGoogle());
    await execute(
      useCase: () => _signInWithGoogleUseCase(),
      onSuccess: (user) => safeEmit(SignInState.success(user)),
      onError: (failure) => safeEmit(SignInState.failure(failure)),
    );
  }
}
