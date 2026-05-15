import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/utils/repository_guard_mixin.dart';
import 'package:paiting_by_numbers/features/auth/navigation/data/services/auth_service.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with RepositoryGuardMixin implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Stream<UserEntity?> get authStateChanges =>
      _authService.authStateChanges.map((user) => user?.toEntity());

  @override
  UserEntity? get currentUser => _authService.currentUser?.toEntity();

  @override
  Future<Either<Failure, void>> logOut() => guard(() => _authService.logOut());

  @override
  Future<Either<Failure, void>> sendPasswordResetLink({
    required String email,
  }) => guard(() => _authService.sendPasswordResetLink(email: email));

  @override
  Future<Either<Failure, void>> sendEmailVerification() =>
      guard(() => _authService.sendEmailVerification());

  @override
  Future<Either<Failure, void>> reloadUser() =>
      guard(() => _authService.reloadUser());

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) => guard(() async {
        final userModel = await _authService.signInWithEmail(
          email: email,
          password: password,
        );
        return userModel.toEntity();
      });

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() => guard(() async {
        final userModel = await _authService.signInWithGoogle();
        return userModel.toEntity();
      });

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  }) => guard(() async {
        final userModel = await _authService.signUpWithEmail(
          email: email,
          password: password,
        );
        return userModel.toEntity();
      });
}
