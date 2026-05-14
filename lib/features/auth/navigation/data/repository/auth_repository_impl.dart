import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure_mapper.dart';
import 'package:paiting_by_numbers/features/auth/navigation/data/services/auth_service.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Stream<UserEntity?> get authStateChanges =>
      _authService.authStateChanges.map((user) => user?.toEntity());

  @override
  UserEntity? get currentUser => _authService.currentUser?.toEntity();

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _authService.logOut();
      return const Right(null);
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetLink({
    required String email,
  }) async {
    try {
      await _authService.sendPasswordResetLink(email: email);
      return const Right(null);
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _authService.signInWithEmail(
        email: email,
        password: password,
      );
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final userModel = await _authService.signInWithGoogle();
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _authService.signUpWithEmail(
        email: email,
        password: password,
      );
      return Right(userModel.toEntity());
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return Left(FailureMapper.from(e));
    }
  }
}
