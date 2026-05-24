import 'package:freezed_annotation/freezed_annotation.dart';

part 'painting_response.freezed.dart';
part 'painting_response.g.dart';

@freezed
abstract class PaintingResponse with _$PaintingResponse {
  const factory PaintingResponse({
    required PaintingInfo info,
    required List<PaintingModel> data,
  }) = _PaintingResponse;

  factory PaintingResponse.fromJson(Map<String, dynamic> json) =>
      _$PaintingResponseFromJson(json);
}

@freezed
abstract class PaintingInfo with _$PaintingInfo {
  const factory PaintingInfo({required int total}) = _PaintingInfo;

  factory PaintingInfo.fromJson(Map<String, dynamic> json) =>
      _$PaintingInfoFromJson(json);
}

@freezed
abstract class PaintingModel with _$PaintingModel {
  const factory PaintingModel({
    required int id,
    @JsonKey(name: 'accession_number') required String accessionNumber,
    required String title,
    @JsonKey(name: 'creation_date') required String creationDate,
    @JsonKey(name: 'creation_date_latest') int? creationDateLatest,
    required List<CreatorModel> creators,
    required PaintingImages images,
    String? description,
  }) = _PaintingModel;

  factory PaintingModel.fromJson(Map<String, dynamic> json) =>
      _$PaintingModelFromJson(json);
}

@freezed
abstract class CreatorModel with _$CreatorModel {
  const factory CreatorModel({
    required String description,
    String? role,
    String? biography,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}

@freezed
abstract class PaintingImages with _$PaintingImages {
  const factory PaintingImages({
    required PaintingImageSize web,
    PaintingImageSize? print,
    PaintingImageSize? full,
  }) = _PaintingImages;

  factory PaintingImages.fromJson(Map<String, dynamic> json) =>
      _$PaintingImagesFromJson(json);
}

@freezed
abstract class PaintingImageSize with _$PaintingImageSize {
  const factory PaintingImageSize({
    required String url,
    Object? width, // Can be String or int in different API versions
    Object? height,
  }) = _PaintingImageSize;

  factory PaintingImageSize.fromJson(Map<String, dynamic> json) =>
      _$PaintingImageSizeFromJson(json);
}
