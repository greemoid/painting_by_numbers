import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, void>> sendPasswordResetLink({required String email});

  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, void>> reloadUser();

  Stream<UserEntity?> get authStateChanges;

  UserEntity? get currentUser;

  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
