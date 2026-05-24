import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/quantization_type.dart';

part 'create_painting_state.freezed.dart';

@freezed
abstract class CreatePaintingState with _$CreatePaintingState {
  const factory CreatePaintingState({
    @Default(QuantizationType.many) QuantizationType quantizationType,
    @Default(25) int customColorsCount,
    @Default(false) bool isQuantizing,
  }) = _CreatePaintingState;
}
