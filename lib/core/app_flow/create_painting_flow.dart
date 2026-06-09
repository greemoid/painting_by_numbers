import 'package:flutter/widgets.dart';

/// Contract for transitioning to the painting creation flow.
abstract interface class CreatePaintingFlow {
  /// Start the creation flow with a specific network image URL and optional metadata.
  void startWithImageUrl(
    BuildContext context,
    String imageUrl, {
    String? title,
    String? author,
    String? year,
  });
}
