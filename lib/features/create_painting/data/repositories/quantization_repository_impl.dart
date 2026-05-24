import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/native/rust/api/simple.dart' as rust;
import 'package:paiting_by_numbers/core/utils/repository_guard_mixin.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/repositories/quantization_repository.dart';

@LazySingleton(as: QuantizationRepository)
class QuantizationRepositoryImpl
    with RepositoryGuardMixin
    implements QuantizationRepository {
  const QuantizationRepositoryImpl();

  @override
  Future<Either<Failure, QuantizationResult>> vectorizeImage({
    required List<int> imageBytes,
    required int colors,
  }) => guard(() async {
    final result = await rust.vectorizeImageToSvg(
      imageBytes: imageBytes,
      colors: colors,
    );

    final palette = result.palette
        .map((entry) => PaletteColor(rgb: entry.rgb.toList(), hex: entry.hex))
        .toList();

    return QuantizationResult(svgContent: result.svgContent, palette: palette);
  });
}
