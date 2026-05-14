import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@injectable
class LogOutUseCase {
  final AuthRepository _authRepository;
  final SessionManager _sessionManager;

  LogOutUseCase(this._authRepository, this._sessionManager);

  Future<Either<Failure, void>> call() async {
    final result = await _authRepository.logOut();

    return result.fold(
      (failure) => Left(failure),
      (_) async {
        await _sessionManager.closeSession();
        return const Right(null);
      },
    );
  }
}
