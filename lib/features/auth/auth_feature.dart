import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/auth/navigation/auth_routes.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/forgot_password_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/sign_in_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/sign_up_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/forgot_password/forgot_password_cubit.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_in/sign_in_cubit.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_up/sign_up_cubit.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/screens/verify_email_screen.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/verify_email/verify_email_cubit.dart';

final class AuthFeature implements FeatureModule {
  const AuthFeature();

  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: AuthRoutes.signIn,
          builder: (context, state) => BlocProvider(
            create: (context) => locator<SignInCubit>(),
            child: const SignInScreen(),
          ),
        ),
        GoRoute(
          path: AuthRoutes.signUp,
          builder: (context, state) => BlocProvider(
            create: (context) => locator<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        ),
        GoRoute(
          path: AuthRoutes.forgotPassword,
          builder: (context, state) => BlocProvider(
            create: (context) => locator<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        ),
        GoRoute(
          path: AuthRoutes.verifyEmail,
          builder: (context, state) => BlocProvider(
            create: (context) => locator<VerifyEmailCubit>(),
            child: const VerifyEmailScreen(),
          ),
        ),
      ];
}

