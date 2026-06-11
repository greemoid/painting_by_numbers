import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/app_flow/create_painting_flow.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/gallery/presentation/state/my_paintings_cubit.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting.dart';
import 'package:paiting_by_numbers/features/home/navigation/home_routes.dart';
import 'package:paiting_by_numbers/features/home/presentation/screens/painting_detail_screen.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_cubit.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/painting_detail/painting_detail_cubit.dart';
import 'package:paiting_by_numbers/features/home/presentation/home_screen.dart';

class HomeFeature implements FeatureModule {
  const HomeFeature();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: HomeRoutes.home,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<ExplorePaintingsCubit>()),
          BlocProvider(create: (context) => locator<MyPaintingsCubit>()),
        ],
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: HomeRoutes.paintingDetail,
      builder: (context, state) {
        final painting = state.extra as Painting;
        return BlocProvider(
          create: (context) => locator<PaintingDetailCubit>(),
          child: PaintingDetailScreen(
            paintingId: painting.id,
            title: painting.title,
            author: painting.author,
            year: painting.year,
            imageUrl: painting.imageUrl,
            aspectRatio: painting.aspectRatio,
            createPaintingFlow: locator<CreatePaintingFlow>(),
          ),
        );
      },
    ),
  ];
}
