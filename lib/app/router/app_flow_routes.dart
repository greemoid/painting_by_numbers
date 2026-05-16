import 'package:paiting_by_numbers/core/app_flow/app_flow.dart';
import 'package:paiting_by_numbers/features/auth/navigation/auth_routes.dart';
import 'package:paiting_by_numbers/features/home/navigation/home_routes.dart';

/// Maps [AppFlow] to a concrete route path.
abstract final class AppFlowRoutes {
  /// Base paths for the two main application states
  static const auth = '/auth';
  static const main = '/main';

  /// Resolves the starting path for a given flow
  static String pathFor(AppFlow flow) => switch (flow) {
    AppFlow.auth => AuthRoutes.signIn,
    AppFlow.verifyEmail => AuthRoutes.verifyEmail,
    AppFlow.main => HomeRoutes.home,
  };
}
