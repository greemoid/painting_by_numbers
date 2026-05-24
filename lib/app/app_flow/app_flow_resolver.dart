import 'package:paiting_by_numbers/core/app_flow/app_flow.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_status.dart';

class AppFlowResolver {
  /// Determines the current [AppFlow] based on application state.
  static AppFlow resolve({required SessionStatus session}) {
    if (session == SessionStatus.authenticated) {
      return AppFlow.main;
    }

    if (session == SessionStatus.unverified) {
      return AppFlow.verifyEmail;
    }

    return AppFlow.auth;
  }
}
