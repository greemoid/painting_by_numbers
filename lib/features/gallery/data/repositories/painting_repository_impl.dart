import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/features/gallery/data/datasources/firestore_painting_data_source.dart';
import 'package:paiting_by_numbers/features/gallery/data/models/painting_model.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';
import 'package:paiting_by_numbers/features/gallery/domain/repositories/painting_repository.dart';

@LazySingleton(as: PaintingRepository)
class PaintingRepositoryImpl implements PaintingRepository {
  final PaintingDataSource _dataSource;

  PaintingRepositoryImpl(this._dataSource);

  @override
  Stream<List<GeneratedPaintingEntity>> watchMyPaintings(String userId) {
    return _dataSource.watchPaintings(userId).map(
          (models) => models.cast<GeneratedPaintingEntity>(),
        );
  }

  @override
  Future<void> saveGeneratedPainting(String userId, GeneratedPaintingEntity painting) async {
    final model = GeneratedPaintingModel.fromEntity(painting);
    await _dataSource.savePainting(userId, model);
  }
}
