import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/create_painting/create_painting_feature.dart';
import 'package:paiting_by_numbers/features/home/home_feature.dart';
import 'package:paiting_by_numbers/app/ui/main_navigation_screen.dart';
import 'package:paiting_by_numbers/features/settings/settings_feature.dart';

abstract final class AppRouterShell {
  static StatefulShellRoute build({required List<FeatureModule> features}) {
    final homeFeature = features.whereType<HomeFeature>().first;
    final createFeature = features.whereType<CreatePaintingFeature>().first;
    final settingsFeature = features.whereType<SettingsFeature>().first;

    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainNavigationScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: homeFeature.routes),
        StatefulShellBranch(routes: createFeature.routes),
        StatefulShellBranch(routes: settingsFeature.routes),
      ],
    );
  }

  /// Returns features that are NOT part of the bottom navigation shell
  static List<FeatureModule> getStandaloneFeatures(
    List<FeatureModule> features,
  ) {
    return features
        .where(
          (feature) =>
              feature is! HomeFeature &&
              feature is! CreatePaintingFeature &&
              feature is! SettingsFeature,
        )
        .toList();
  }
}
