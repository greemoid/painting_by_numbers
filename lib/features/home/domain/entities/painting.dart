import 'package:freezed_annotation/freezed_annotation.dart';

part 'painting.freezed.dart';

@freezed
abstract class Painting with _$Painting {
  const factory Painting({
    required int id,
    required String title,
    required String author,
    required String year,
    required String imageUrl,
    @Default(0.75) double aspectRatio,
  }) = _Painting;
}
