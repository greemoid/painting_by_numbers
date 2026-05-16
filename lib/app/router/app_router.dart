import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/app/app_flow/app_flow_cubit.dart';
import 'package:paiting_by_numbers/app/router/app_flow_routes.dart';
import 'package:paiting_by_numbers/core/app_flow/app_flow.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';

import 'package:paiting_by_numbers/app/router/app_router_shell.dart';

final class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final class AppRouter {
  /// Global navigator key for accessing context from services or snackbars
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const AppRouter._();

  static GoRouter create({required List<FeatureModule> features}) {
    final appFlowCubit = locator<AppFlowCubit>();

    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppFlowRoutes.pathFor(appFlowCubit.state),
      refreshListenable: _GoRouterRefreshStream(appFlowCubit.stream),
      redirect: (context, state) => _redirect(state, appFlowCubit.state),
      routes: <RouteBase>[
        AppRouterShell.build(features: features),
        // Add other feature routes (like Auth) outside the main navigation shell
        for (final feature in AppRouterShell.getStandaloneFeatures(features))
          ...feature.routes,
      ],
    );
  }

  static String? _redirect(GoRouterState state, AppFlow flow) {
    final target = AppFlowRoutes.pathFor(flow);
    final location = state.matchedLocation;

    if (location == target) return null;

    // Authentication Guard
    if (flow == AppFlow.auth && !location.startsWith(AppFlowRoutes.auth)) {
      return AppFlowRoutes.signIn;
    }

    if (flow == AppFlow.verifyEmail && location != AppFlowRoutes.verifyEmail) {
      return AppFlowRoutes.verifyEmail;
    }

    if (flow == AppFlow.main && !location.startsWith(AppFlowRoutes.main)) {
      return AppFlowRoutes.home;
    }

    // Allow sub-routes within the current flow
    return null;
  }
}
