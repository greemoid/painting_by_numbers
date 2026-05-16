import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/auth/auth_feature.dart';
import 'package:paiting_by_numbers/features/home/home_feature.dart';
import 'package:paiting_by_numbers/features/create_painting/create_painting_feature.dart';
import 'package:paiting_by_numbers/features/settings/settings_feature.dart';

const List<FeatureModule> appFeatures = [
  AuthFeature(),
  HomeFeature(),
  CreatePaintingFeature(),
  SettingsFeature(),
];
