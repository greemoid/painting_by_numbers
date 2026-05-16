import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/create_painting/create_painting_feature.dart';
import 'package:paiting_by_numbers/features/home/home_feature.dart';
import 'package:paiting_by_numbers/app/ui/main_navigation_screen.dart';
import 'package:paiting_by_numbers/features/settings/settings_feature.dart';

abstract final class AppRouterShell {
  /// Features that should be integrated into the bottom navigation bar
  static const _shellFeatureTypes = [
    HomeFeature,
    CreatePaintingFeature,
    SettingsFeature,
  ];

  static StatefulShellRoute build({required List<FeatureModule> features}) {
    final homeFeature = features.whereType<HomeFeature>().firstOrNull;
    final createFeature = features.whereType<CreatePaintingFeature>().firstOrNull;
    final settingsFeature = features.whereType<SettingsFeature>().firstOrNull;

    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainNavigationScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(routes: homeFeature?.routes ?? []),
        StatefulShellBranch(routes: createFeature?.routes ?? []),
        StatefulShellBranch(routes: settingsFeature?.routes ?? []),
      ],
    );
  }

  /// Returns features that are NOT part of the bottom navigation shell
  static List<FeatureModule> getStandaloneFeatures(List<FeatureModule> features) {
    return features.where((feature) {
      return !_shellFeatureTypes.any((type) => feature.runtimeType == type);
    }).toList();
  }
}
