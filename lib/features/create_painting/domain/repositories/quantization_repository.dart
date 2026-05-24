import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';

abstract class QuantizationRepository {
  Future<Either<Failure, QuantizationResult>> vectorizeImage({
    required List<int> imageBytes,
    required int colors,
  });
}
