import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/paintings_page.dart';
import 'package:paiting_by_numbers/features/home/domain/repositories/paintings_repository.dart';

@injectable
class GetHighlightedPaintingsUseCase {
  final PaintingsRepository _repository;

  GetHighlightedPaintingsUseCase(this._repository);

  Future<Either<Failure, PaintingsPage>> call({
    int skip = 0,
    int limit = 20,
  }) async => _repository.getHighlightedPaintings(skip: skip, limit: limit);
}
