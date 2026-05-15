import 'package:paiting_by_numbers/features/auth/navigation/data/models/user/user_model.dart';

abstract interface class AuthService {
  Future<void> logOut();

  Future<void> sendPasswordResetLink({required String email});

  Future<void> sendEmailVerification();

  Future<void> reloadUser();

  Stream<UserModel?> get authStateChanges;

  UserModel? get currentUser;

  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();
}
