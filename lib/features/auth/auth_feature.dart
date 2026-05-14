import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/auth/navigation/auth_routes.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/forgot_password_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/sign_in_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/sign_up_screen.dart';

final class AuthFeature implements FeatureModule {
  const AuthFeature();

  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: AuthRoutes.signIn,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: AuthRoutes.signUp,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: AuthRoutes.forgotPassword,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
      ];
}
