import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/app_flow/create_painting_flow.dart';
import 'package:paiting_by_numbers/features/create_painting/navigation/create_painting_routes.dart';

@LazySingleton(as: CreatePaintingFlow)
class CreatePaintingFlowImpl implements CreatePaintingFlow {
  @override
  void startWithImageUrl(
    BuildContext context,
    String imageUrl, {
    String? title,
    String? author,
    String? year,
  }) {
    context.push(
      CreatePaintingRoutes.createPainting,
      extra: {
        'imageUrl': imageUrl,
        'title': title,
        'author': author,
        'year': year,
      },
    );
  }
}
