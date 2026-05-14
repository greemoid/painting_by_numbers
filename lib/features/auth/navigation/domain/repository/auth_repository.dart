import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, void>> sendPasswordResetLink({required String email});

  Stream<UserEntity?> get authStateChanges;

  UserEntity? get currentUser;

  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
