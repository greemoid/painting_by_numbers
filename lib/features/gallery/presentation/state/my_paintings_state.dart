import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';

part 'my_paintings_state.freezed.dart';

@freezed
sealed class MyPaintingsState with _$MyPaintingsState {
  const factory MyPaintingsState.initial() = _Initial;

  const factory MyPaintingsState.loading() = _Loading;

  const factory MyPaintingsState.data({
    @Default([]) List<GeneratedPaintingEntity> items,
  }) = _Data;

  const factory MyPaintingsState.error(Failure failure) = _Error;
}
