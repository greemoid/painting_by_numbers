import 'package:google_sign_in/google_sign_in.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';

class GoogleSignInErrorMapper {
  static Failure map(Object error) {
    if (error is GoogleSignInException) {
      switch (error.code) {
        case GoogleSignInExceptionCode.canceled:
          return const CanceledByUserFailure();
        case GoogleSignInExceptionCode.interrupted:
          return const GoogleInterruptedFailure();
        case GoogleSignInExceptionCode.clientConfigurationError:
        case GoogleSignInExceptionCode.providerConfigurationError:
          return const GoogleMisconfiguredFailure();
        case GoogleSignInExceptionCode.uiUnavailable:
          return const GoogleUIUnavailableFailure();
        case GoogleSignInExceptionCode.userMismatch:
          return const GoogleUserMismatchFailure();
        case GoogleSignInExceptionCode.unknownError:
      }
    }
    return const UnknownFailure();
  }
}
