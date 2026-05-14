import 'package:firebase_auth/firebase_auth.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';

class FirebaseErrorMapper {
  static Failure map(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-credential':
        case 'invalid-email':
          return const InvalidCredentialFailure();
        case 'user-not-found':
          return const UserNotFoundFailure();
        case 'wrong-password':
          return const WrongPasswordFailure();
        case 'email-already-in-use':
          return const EmailAlreadyInUseFailure();
        case 'user-disabled':
          return const UserDisabledFailure();
        case 'weak-password':
          return const WeakPasswordFailure();
        case 'operation-not-allowed':
          return const OperationNotAllowedFailure();
        case 'too-many-requests':
          return const TooManyRequestsFailure();
        case 'network-request-failed':
          return const NetworkFailure();
        default:
          return const UnknownFailure();
      }
    } else if (error is FirebaseException) {
      switch (error.code) {
        case 'network-request-failed':
          return const NetworkFailure();
        default:
          return const UnknownFailure();
      }
    }

    return const UnknownFailure();
  }
}
