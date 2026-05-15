import 'package:paiting_by_numbers/core/app_flow/app_flow.dart';

/// Maps [AppFlow] to a concrete route path.
abstract final class AppFlowRoutes {
  /// Base paths for the two main application states
  static const auth = '/auth';
  static const main = '/main';

  /// Internal sub-paths
  static const signIn = '$auth/sign-in';
  static const home = '$main/home';

  static const verifyEmail = '$auth/verify-email';

  /// Resolves the starting path for a given flow
  static String pathFor(AppFlow flow) => switch (flow) {
    AppFlow.auth => signIn,
    AppFlow.verifyEmail => verifyEmail,
    AppFlow.main => home,
  };
}
