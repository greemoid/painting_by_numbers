import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting_detail.dart';
import 'package:paiting_by_numbers/features/home/domain/repositories/paintings_repository.dart';

@injectable
class GetArtworkDetailUseCase {
  final PaintingsRepository _repository;

  GetArtworkDetailUseCase(this._repository);

  Future<Either<Failure, PaintingDetail>> call(int id) async =>
      _repository.getArtworkDetail(id);
}
