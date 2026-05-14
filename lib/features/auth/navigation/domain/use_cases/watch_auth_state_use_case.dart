import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@injectable
class WatchAuthStateUseCase {
  final AuthRepository _authRepository;

  WatchAuthStateUseCase(this._authRepository);

  Stream<UserEntity?> call() {
    return _authRepository.authStateChanges;
  }
}
