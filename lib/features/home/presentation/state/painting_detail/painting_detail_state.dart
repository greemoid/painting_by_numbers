import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting_detail.dart';

part 'painting_detail_state.freezed.dart';

@freezed
sealed class PaintingDetailState with _$PaintingDetailState {
  const factory PaintingDetailState.initial() = _Initial;

  const factory PaintingDetailState.loading() = _Loading;

  const factory PaintingDetailState.data(PaintingDetail detail) = _Data;

  const factory PaintingDetailState.error(Failure failure) = _Error;
}
