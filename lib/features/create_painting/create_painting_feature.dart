import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/feature/feature_module.dart';
import 'package:paiting_by_numbers/features/create_painting/navigation/create_painting_routes.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/screens/create_painting_screen.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_cubit.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_cubit.dart';

class CreatePaintingFeature implements FeatureModule {
  const CreatePaintingFeature();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: CreatePaintingRoutes.createPainting,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<UploadImageCubit>()),
          BlocProvider(create: (_) => locator<CreatePaintingCubit>()),
        ],
        child: const CreatePaintingScreen(),
      ),
    ),
  ];
}
