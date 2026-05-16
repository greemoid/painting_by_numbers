import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/settings/navigation/settings_routes.dart';
import 'package:paiting_by_numbers/features/settings/presentation/screens/settings_screen.dart';

class SettingsFeature implements FeatureModule {
  const SettingsFeature();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: SettingsRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ];
}
