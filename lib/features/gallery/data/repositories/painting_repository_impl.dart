import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/services/storage/file_storage_service.dart';
import 'package:paiting_by_numbers/features/gallery/data/datasources/firestore_painting_data_source.dart';
import 'package:paiting_by_numbers/features/gallery/data/models/painting_model.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';
import 'package:paiting_by_numbers/features/gallery/domain/repositories/painting_repository.dart';

@LazySingleton(as: PaintingRepository)
class PaintingRepositoryImpl implements PaintingRepository {
  final PaintingDataSource _dataSource;
  final FileStorageService _fileStorageService;

  PaintingRepositoryImpl(this._dataSource, this._fileStorageService);

  @override
  Stream<List<GeneratedPaintingEntity>> watchMyPaintings(String userId) {
    return _dataSource.watchPaintings(userId).asyncMap((models) async {
      final futures = models.map((model) async {
        final resolvedPath = await _fileStorageService.getAbsolutePath(model.localImagePath);
        return GeneratedPaintingEntity(
          id: model.id,
          networkId: model.networkId,
          name: model.name,
          artist: model.artist,
          year: model.year,
          localImagePath: resolvedPath,
          colors: model.colors,
          createdAt: model.createdAt,
        );
      });
      return Future.wait(futures);
    });
  }

  @override
  Future<void> saveGeneratedPainting(String userId, GeneratedPaintingEntity painting) async {
    final model = GeneratedPaintingModel.fromEntity(painting);
    await _dataSource.savePainting(userId, model);
  }
}
