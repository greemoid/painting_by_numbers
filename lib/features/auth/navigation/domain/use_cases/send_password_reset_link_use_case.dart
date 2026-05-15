import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@injectable
class SendPasswordResetLinkUseCase {
  final AuthRepository _authRepository;

  SendPasswordResetLinkUseCase(this._authRepository);

  Future<Either<Failure, void>> call({required String email}) {
    return _authRepository.sendPasswordResetLink(email: email);
  }
}
