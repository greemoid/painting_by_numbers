import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@injectable
class SignUpWithEmailUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String username,
  }) {
    return _authRepository.signUpWithEmail(
      email: email,
      password: password,
      username: username,
    );
  }
}
