import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';
import 'package:paiting_by_numbers/features/gallery/domain/repositories/painting_repository.dart';

@injectable
class SaveGeneratedPaintingUseCase {
  final PaintingRepository _repository;

  SaveGeneratedPaintingUseCase(this._repository);

  Future<void> call(String userId, GeneratedPaintingEntity painting) async {
    return _repository.saveGeneratedPainting(userId, painting);
  }
}
