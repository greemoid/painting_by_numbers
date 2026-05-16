import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/create_painting/navigation/create_painting_routes.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/screens/create_painting_screen.dart';

class CreatePaintingFeature implements FeatureModule {
  const CreatePaintingFeature();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: CreatePaintingRoutes.createPainting,
      builder: (context, state) => const CreatePaintingScreen(),
    ),
  ];
}
