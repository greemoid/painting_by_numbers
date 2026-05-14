import 'package:go_router/go_router.dart';

/// Contract for a feature module.
/// Provides routes and (optionally) UI-scoped dependencies for the app.
abstract interface class FeatureModule {
  List<RouteBase> get routes;
}
