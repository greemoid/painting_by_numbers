import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting_detail.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/paintings_page.dart';

abstract class PaintingsRepository {
  Future<Either<Failure, PaintingsPage>> getHighlightedPaintings({
    int skip = 0,
    int limit = 20,
  });

  Future<Either<Failure, PaintingDetail>> getArtworkDetail(int id);
}
