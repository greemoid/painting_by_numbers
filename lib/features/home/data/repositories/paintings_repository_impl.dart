import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/failures/failure_mapper.dart';
import 'package:paiting_by_numbers/features/home/data/api/paintings_api.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/paintings_page.dart';
import 'package:paiting_by_numbers/features/home/domain/repositories/paintings_repository.dart';

@LazySingleton(as: PaintingsRepository)
class PaintingsRepositoryImpl implements PaintingsRepository {
  final PaintingsApi _api;

  PaintingsRepositoryImpl(this._api);

  @override
  Future<Either<Failure, PaintingsPage>> getHighlightedPaintings({
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final response = await _api.getHighlightedPaintings(
        skip: skip,
        limit: limit,
      );

      final paintings = response.data.map((model) {
        final authorName = model.creators.isNotEmpty
            ? model.creators.first.description
            : 'Unknown Artist';

        final year = model.creationDateLatest != null
            ? model.creationDateLatest.toString()
            : model.creationDate;

        final w = _toDouble(model.images.web.width);
        final h = _toDouble(model.images.web.height);
        final aspectRatio = (w > 0 && h > 0) ? w / h : 0.75;

        return Painting(
          id: model.id,
          title: model.title,
          author: authorName,
          year: year,
          imageUrl: model.images.web.url,
          aspectRatio: aspectRatio,
        );
      }).toList();

      return Right(PaintingsPage(items: paintings, total: response.info.total));
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }
}

double _toDouble(Object? value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}
