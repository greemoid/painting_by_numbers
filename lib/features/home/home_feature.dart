import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/app/router/app_flow_routes.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/home/presentation/home_screen.dart';

class HomeFeature implements FeatureModule {
  const HomeFeature();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: AppFlowRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}
