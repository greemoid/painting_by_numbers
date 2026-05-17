import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting.dart';

part 'explore_paintings_state.freezed.dart';

@freezed
sealed class ExplorePaintingsState with _$ExplorePaintingsState {
  const factory ExplorePaintingsState.initial() = _Initial;

  const factory ExplorePaintingsState.loading() = _Loading;

  const factory ExplorePaintingsState.data({
    required PagingState<int, Painting> pagingState,
    @Default(0) int total,
  }) = _Data;

  const factory ExplorePaintingsState.error(Failure failure) = _Error;
}
