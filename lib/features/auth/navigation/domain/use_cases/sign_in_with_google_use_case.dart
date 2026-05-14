import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@injectable
class SignInWithGoogleUseCase {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call() {
    return _authRepository.signInWithGoogle();
  }
}
