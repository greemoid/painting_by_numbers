import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';

abstract interface class PaintingRepository {
  Stream<List<GeneratedPaintingEntity>> watchMyPaintings(String userId);
  Future<void> saveGeneratedPainting(String userId, GeneratedPaintingEntity painting);
}
