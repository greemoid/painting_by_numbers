import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/repositories/quantization_repository.dart';

@injectable
class VectorizeImageUseCase {
  final QuantizationRepository _quantizationRepository;

  VectorizeImageUseCase(this._quantizationRepository);

  Future<Either<Failure, QuantizationResult>> call({
    required List<int> imageBytes,
    required int colors,
  }) =>
      _quantizationRepository.vectorizeImage(
        imageBytes: imageBytes,
        colors: colors,
      );
}
