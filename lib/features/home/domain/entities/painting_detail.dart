import 'package:freezed_annotation/freezed_annotation.dart';

part 'painting_detail.freezed.dart';

@freezed
abstract class PaintingDetail with _$PaintingDetail {
  const factory PaintingDetail({
    required int id,
    required String title,
    required String author,
    required String year,
    required String imageUrl,
    required double aspectRatio,
    String? description,
    String? technique,
    List<String>? culture,
    String? measurements,
    String? department,
    String? authorBiography,
  }) = _PaintingDetail;
}
