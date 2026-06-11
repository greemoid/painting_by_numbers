// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaintingResponse _$PaintingResponseFromJson(Map<String, dynamic> json) =>
    _PaintingResponse(
      info: PaintingInfo.fromJson(json['info'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => PaintingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaintingResponseToJson(_PaintingResponse instance) =>
    <String, dynamic>{'info': instance.info, 'data': instance.data};

_PaintingInfo _$PaintingInfoFromJson(Map<String, dynamic> json) =>
    _PaintingInfo(total: (json['total'] as num).toInt());

Map<String, dynamic> _$PaintingInfoToJson(_PaintingInfo instance) =>
    <String, dynamic>{'total': instance.total};

_PaintingModel _$PaintingModelFromJson(Map<String, dynamic> json) =>
    _PaintingModel(
      id: (json['id'] as num).toInt(),
      accessionNumber: json['accession_number'] as String,
      title: json['title'] as String,
      creationDate: json['creation_date'] as String,
      creationDateLatest: (json['creation_date_latest'] as num?)?.toInt(),
      creators: (json['creators'] as List<dynamic>)
          .map((e) => CreatorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: json['images'] == null
          ? null
          : PaintingImages.fromJson(json['images'] as Map<String, dynamic>),
      description: json['description'] as String?,
      technique: json['technique'] as String?,
      culture: (json['culture'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      measurements: json['measurements'] as String?,
      department: json['department'] as String?,
    );

Map<String, dynamic> _$PaintingModelToJson(_PaintingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accession_number': instance.accessionNumber,
      'title': instance.title,
      'creation_date': instance.creationDate,
      'creation_date_latest': instance.creationDateLatest,
      'creators': instance.creators,
      'images': instance.images,
      'description': instance.description,
      'technique': instance.technique,
      'culture': instance.culture,
      'measurements': instance.measurements,
      'department': instance.department,
    };

_PaintingDetailResponse _$PaintingDetailResponseFromJson(
  Map<String, dynamic> json,
) => _PaintingDetailResponse(
  data: PaintingModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaintingDetailResponseToJson(
  _PaintingDetailResponse instance,
) => <String, dynamic>{'data': instance.data};

_CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) =>
    _CreatorModel(
      description: json['description'] as String,
      role: json['role'] as String?,
      biography: json['biography'] as String?,
    );

Map<String, dynamic> _$CreatorModelToJson(_CreatorModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'role': instance.role,
      'biography': instance.biography,
    };

_PaintingImages _$PaintingImagesFromJson(Map<String, dynamic> json) =>
    _PaintingImages(
      web: json['web'] == null
          ? null
          : PaintingImageSize.fromJson(json['web'] as Map<String, dynamic>),
      print: json['print'] == null
          ? null
          : PaintingImageSize.fromJson(json['print'] as Map<String, dynamic>),
      full: json['full'] == null
          ? null
          : PaintingImageSize.fromJson(json['full'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaintingImagesToJson(_PaintingImages instance) =>
    <String, dynamic>{
      'web': instance.web,
      'print': instance.print,
      'full': instance.full,
    };

_PaintingImageSize _$PaintingImageSizeFromJson(Map<String, dynamic> json) =>
    _PaintingImageSize(
      url: json['url'] as String,
      width: json['width'],
      height: json['height'],
    );

Map<String, dynamic> _$PaintingImageSizeToJson(_PaintingImageSize instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
