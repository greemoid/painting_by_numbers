// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painting_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaintingResponse {

 PaintingInfo get info; List<PaintingModel> get data;
/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingResponseCopyWith<PaintingResponse> get copyWith => _$PaintingResponseCopyWithImpl<PaintingResponse>(this as PaintingResponse, _$identity);

  /// Serializes this PaintingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingResponse&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PaintingResponse(info: $info, data: $data)';
}


}

/// @nodoc
abstract mixin class $PaintingResponseCopyWith<$Res>  {
  factory $PaintingResponseCopyWith(PaintingResponse value, $Res Function(PaintingResponse) _then) = _$PaintingResponseCopyWithImpl;
@useResult
$Res call({
 PaintingInfo info, List<PaintingModel> data
});


$PaintingInfoCopyWith<$Res> get info;

}
/// @nodoc
class _$PaintingResponseCopyWithImpl<$Res>
    implements $PaintingResponseCopyWith<$Res> {
  _$PaintingResponseCopyWithImpl(this._self, this._then);

  final PaintingResponse _self;
  final $Res Function(PaintingResponse) _then;

/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? data = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PaintingInfo,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaintingModel>,
  ));
}
/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingInfoCopyWith<$Res> get info {
  
  return $PaintingInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaintingResponse].
extension PaintingResponsePatterns on PaintingResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaintingResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaintingInfo info,  List<PaintingModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingResponse() when $default != null:
return $default(_that.info,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaintingInfo info,  List<PaintingModel> data)  $default,) {final _that = this;
switch (_that) {
case _PaintingResponse():
return $default(_that.info,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaintingInfo info,  List<PaintingModel> data)?  $default,) {final _that = this;
switch (_that) {
case _PaintingResponse() when $default != null:
return $default(_that.info,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaintingResponse implements PaintingResponse {
  const _PaintingResponse({required this.info, required final  List<PaintingModel> data}): _data = data;
  factory _PaintingResponse.fromJson(Map<String, dynamic> json) => _$PaintingResponseFromJson(json);

@override final  PaintingInfo info;
 final  List<PaintingModel> _data;
@override List<PaintingModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingResponseCopyWith<_PaintingResponse> get copyWith => __$PaintingResponseCopyWithImpl<_PaintingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaintingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingResponse&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PaintingResponse(info: $info, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaintingResponseCopyWith<$Res> implements $PaintingResponseCopyWith<$Res> {
  factory _$PaintingResponseCopyWith(_PaintingResponse value, $Res Function(_PaintingResponse) _then) = __$PaintingResponseCopyWithImpl;
@override @useResult
$Res call({
 PaintingInfo info, List<PaintingModel> data
});


@override $PaintingInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$PaintingResponseCopyWithImpl<$Res>
    implements _$PaintingResponseCopyWith<$Res> {
  __$PaintingResponseCopyWithImpl(this._self, this._then);

  final _PaintingResponse _self;
  final $Res Function(_PaintingResponse) _then;

/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? data = null,}) {
  return _then(_PaintingResponse(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PaintingInfo,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaintingModel>,
  ));
}

/// Create a copy of PaintingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingInfoCopyWith<$Res> get info {
  
  return $PaintingInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$PaintingInfo {

 int get total;
/// Create a copy of PaintingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingInfoCopyWith<PaintingInfo> get copyWith => _$PaintingInfoCopyWithImpl<PaintingInfo>(this as PaintingInfo, _$identity);

  /// Serializes this PaintingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingInfo&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'PaintingInfo(total: $total)';
}


}

/// @nodoc
abstract mixin class $PaintingInfoCopyWith<$Res>  {
  factory $PaintingInfoCopyWith(PaintingInfo value, $Res Function(PaintingInfo) _then) = _$PaintingInfoCopyWithImpl;
@useResult
$Res call({
 int total
});




}
/// @nodoc
class _$PaintingInfoCopyWithImpl<$Res>
    implements $PaintingInfoCopyWith<$Res> {
  _$PaintingInfoCopyWithImpl(this._self, this._then);

  final PaintingInfo _self;
  final $Res Function(PaintingInfo) _then;

/// Create a copy of PaintingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaintingInfo].
extension PaintingInfoPatterns on PaintingInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingInfo value)  $default,){
final _that = this;
switch (_that) {
case _PaintingInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingInfo() when $default != null:
return $default(_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total)  $default,) {final _that = this;
switch (_that) {
case _PaintingInfo():
return $default(_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total)?  $default,) {final _that = this;
switch (_that) {
case _PaintingInfo() when $default != null:
return $default(_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaintingInfo implements PaintingInfo {
  const _PaintingInfo({required this.total});
  factory _PaintingInfo.fromJson(Map<String, dynamic> json) => _$PaintingInfoFromJson(json);

@override final  int total;

/// Create a copy of PaintingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingInfoCopyWith<_PaintingInfo> get copyWith => __$PaintingInfoCopyWithImpl<_PaintingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaintingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingInfo&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'PaintingInfo(total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaintingInfoCopyWith<$Res> implements $PaintingInfoCopyWith<$Res> {
  factory _$PaintingInfoCopyWith(_PaintingInfo value, $Res Function(_PaintingInfo) _then) = __$PaintingInfoCopyWithImpl;
@override @useResult
$Res call({
 int total
});




}
/// @nodoc
class __$PaintingInfoCopyWithImpl<$Res>
    implements _$PaintingInfoCopyWith<$Res> {
  __$PaintingInfoCopyWithImpl(this._self, this._then);

  final _PaintingInfo _self;
  final $Res Function(_PaintingInfo) _then;

/// Create a copy of PaintingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(_PaintingInfo(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaintingModel {

 int get id;@JsonKey(name: 'accession_number') String get accessionNumber; String get title;@JsonKey(name: 'creation_date') String get creationDate;@JsonKey(name: 'creation_date_latest') int? get creationDateLatest; List<CreatorModel> get creators; PaintingImages get images; String? get description;
/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingModelCopyWith<PaintingModel> get copyWith => _$PaintingModelCopyWithImpl<PaintingModel>(this as PaintingModel, _$identity);

  /// Serializes this PaintingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accessionNumber, accessionNumber) || other.accessionNumber == accessionNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationDateLatest, creationDateLatest) || other.creationDateLatest == creationDateLatest)&&const DeepCollectionEquality().equals(other.creators, creators)&&(identical(other.images, images) || other.images == images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accessionNumber,title,creationDate,creationDateLatest,const DeepCollectionEquality().hash(creators),images,description);

@override
String toString() {
  return 'PaintingModel(id: $id, accessionNumber: $accessionNumber, title: $title, creationDate: $creationDate, creationDateLatest: $creationDateLatest, creators: $creators, images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class $PaintingModelCopyWith<$Res>  {
  factory $PaintingModelCopyWith(PaintingModel value, $Res Function(PaintingModel) _then) = _$PaintingModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'accession_number') String accessionNumber, String title,@JsonKey(name: 'creation_date') String creationDate,@JsonKey(name: 'creation_date_latest') int? creationDateLatest, List<CreatorModel> creators, PaintingImages images, String? description
});


$PaintingImagesCopyWith<$Res> get images;

}
/// @nodoc
class _$PaintingModelCopyWithImpl<$Res>
    implements $PaintingModelCopyWith<$Res> {
  _$PaintingModelCopyWithImpl(this._self, this._then);

  final PaintingModel _self;
  final $Res Function(PaintingModel) _then;

/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accessionNumber = null,Object? title = null,Object? creationDate = null,Object? creationDateLatest = freezed,Object? creators = null,Object? images = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accessionNumber: null == accessionNumber ? _self.accessionNumber : accessionNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as String,creationDateLatest: freezed == creationDateLatest ? _self.creationDateLatest : creationDateLatest // ignore: cast_nullable_to_non_nullable
as int?,creators: null == creators ? _self.creators : creators // ignore: cast_nullable_to_non_nullable
as List<CreatorModel>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as PaintingImages,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImagesCopyWith<$Res> get images {
  
  return $PaintingImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaintingModel].
extension PaintingModelPatterns on PaintingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingModel value)  $default,){
final _that = this;
switch (_that) {
case _PaintingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'accession_number')  String accessionNumber,  String title, @JsonKey(name: 'creation_date')  String creationDate, @JsonKey(name: 'creation_date_latest')  int? creationDateLatest,  List<CreatorModel> creators,  PaintingImages images,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingModel() when $default != null:
return $default(_that.id,_that.accessionNumber,_that.title,_that.creationDate,_that.creationDateLatest,_that.creators,_that.images,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'accession_number')  String accessionNumber,  String title, @JsonKey(name: 'creation_date')  String creationDate, @JsonKey(name: 'creation_date_latest')  int? creationDateLatest,  List<CreatorModel> creators,  PaintingImages images,  String? description)  $default,) {final _that = this;
switch (_that) {
case _PaintingModel():
return $default(_that.id,_that.accessionNumber,_that.title,_that.creationDate,_that.creationDateLatest,_that.creators,_that.images,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'accession_number')  String accessionNumber,  String title, @JsonKey(name: 'creation_date')  String creationDate, @JsonKey(name: 'creation_date_latest')  int? creationDateLatest,  List<CreatorModel> creators,  PaintingImages images,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _PaintingModel() when $default != null:
return $default(_that.id,_that.accessionNumber,_that.title,_that.creationDate,_that.creationDateLatest,_that.creators,_that.images,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaintingModel implements PaintingModel {
  const _PaintingModel({required this.id, @JsonKey(name: 'accession_number') required this.accessionNumber, required this.title, @JsonKey(name: 'creation_date') required this.creationDate, @JsonKey(name: 'creation_date_latest') this.creationDateLatest, required final  List<CreatorModel> creators, required this.images, this.description}): _creators = creators;
  factory _PaintingModel.fromJson(Map<String, dynamic> json) => _$PaintingModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'accession_number') final  String accessionNumber;
@override final  String title;
@override@JsonKey(name: 'creation_date') final  String creationDate;
@override@JsonKey(name: 'creation_date_latest') final  int? creationDateLatest;
 final  List<CreatorModel> _creators;
@override List<CreatorModel> get creators {
  if (_creators is EqualUnmodifiableListView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creators);
}

@override final  PaintingImages images;
@override final  String? description;

/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingModelCopyWith<_PaintingModel> get copyWith => __$PaintingModelCopyWithImpl<_PaintingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaintingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accessionNumber, accessionNumber) || other.accessionNumber == accessionNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationDateLatest, creationDateLatest) || other.creationDateLatest == creationDateLatest)&&const DeepCollectionEquality().equals(other._creators, _creators)&&(identical(other.images, images) || other.images == images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accessionNumber,title,creationDate,creationDateLatest,const DeepCollectionEquality().hash(_creators),images,description);

@override
String toString() {
  return 'PaintingModel(id: $id, accessionNumber: $accessionNumber, title: $title, creationDate: $creationDate, creationDateLatest: $creationDateLatest, creators: $creators, images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PaintingModelCopyWith<$Res> implements $PaintingModelCopyWith<$Res> {
  factory _$PaintingModelCopyWith(_PaintingModel value, $Res Function(_PaintingModel) _then) = __$PaintingModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'accession_number') String accessionNumber, String title,@JsonKey(name: 'creation_date') String creationDate,@JsonKey(name: 'creation_date_latest') int? creationDateLatest, List<CreatorModel> creators, PaintingImages images, String? description
});


@override $PaintingImagesCopyWith<$Res> get images;

}
/// @nodoc
class __$PaintingModelCopyWithImpl<$Res>
    implements _$PaintingModelCopyWith<$Res> {
  __$PaintingModelCopyWithImpl(this._self, this._then);

  final _PaintingModel _self;
  final $Res Function(_PaintingModel) _then;

/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accessionNumber = null,Object? title = null,Object? creationDate = null,Object? creationDateLatest = freezed,Object? creators = null,Object? images = null,Object? description = freezed,}) {
  return _then(_PaintingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accessionNumber: null == accessionNumber ? _self.accessionNumber : accessionNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as String,creationDateLatest: freezed == creationDateLatest ? _self.creationDateLatest : creationDateLatest // ignore: cast_nullable_to_non_nullable
as int?,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as List<CreatorModel>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as PaintingImages,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaintingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImagesCopyWith<$Res> get images {
  
  return $PaintingImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// @nodoc
mixin _$CreatorModel {

 String get description; String? get role; String? get biography;
/// Create a copy of CreatorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatorModelCopyWith<CreatorModel> get copyWith => _$CreatorModelCopyWithImpl<CreatorModel>(this as CreatorModel, _$identity);

  /// Serializes this CreatorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatorModel&&(identical(other.description, description) || other.description == description)&&(identical(other.role, role) || other.role == role)&&(identical(other.biography, biography) || other.biography == biography));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,role,biography);

@override
String toString() {
  return 'CreatorModel(description: $description, role: $role, biography: $biography)';
}


}

/// @nodoc
abstract mixin class $CreatorModelCopyWith<$Res>  {
  factory $CreatorModelCopyWith(CreatorModel value, $Res Function(CreatorModel) _then) = _$CreatorModelCopyWithImpl;
@useResult
$Res call({
 String description, String? role, String? biography
});




}
/// @nodoc
class _$CreatorModelCopyWithImpl<$Res>
    implements $CreatorModelCopyWith<$Res> {
  _$CreatorModelCopyWithImpl(this._self, this._then);

  final CreatorModel _self;
  final $Res Function(CreatorModel) _then;

/// Create a copy of CreatorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? role = freezed,Object? biography = freezed,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,biography: freezed == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatorModel].
extension CreatorModelPatterns on CreatorModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatorModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatorModel value)  $default,){
final _that = this;
switch (_that) {
case _CreatorModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatorModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreatorModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description,  String? role,  String? biography)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatorModel() when $default != null:
return $default(_that.description,_that.role,_that.biography);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description,  String? role,  String? biography)  $default,) {final _that = this;
switch (_that) {
case _CreatorModel():
return $default(_that.description,_that.role,_that.biography);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description,  String? role,  String? biography)?  $default,) {final _that = this;
switch (_that) {
case _CreatorModel() when $default != null:
return $default(_that.description,_that.role,_that.biography);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatorModel implements CreatorModel {
  const _CreatorModel({required this.description, this.role, this.biography});
  factory _CreatorModel.fromJson(Map<String, dynamic> json) => _$CreatorModelFromJson(json);

@override final  String description;
@override final  String? role;
@override final  String? biography;

/// Create a copy of CreatorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatorModelCopyWith<_CreatorModel> get copyWith => __$CreatorModelCopyWithImpl<_CreatorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatorModel&&(identical(other.description, description) || other.description == description)&&(identical(other.role, role) || other.role == role)&&(identical(other.biography, biography) || other.biography == biography));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,role,biography);

@override
String toString() {
  return 'CreatorModel(description: $description, role: $role, biography: $biography)';
}


}

/// @nodoc
abstract mixin class _$CreatorModelCopyWith<$Res> implements $CreatorModelCopyWith<$Res> {
  factory _$CreatorModelCopyWith(_CreatorModel value, $Res Function(_CreatorModel) _then) = __$CreatorModelCopyWithImpl;
@override @useResult
$Res call({
 String description, String? role, String? biography
});




}
/// @nodoc
class __$CreatorModelCopyWithImpl<$Res>
    implements _$CreatorModelCopyWith<$Res> {
  __$CreatorModelCopyWithImpl(this._self, this._then);

  final _CreatorModel _self;
  final $Res Function(_CreatorModel) _then;

/// Create a copy of CreatorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? role = freezed,Object? biography = freezed,}) {
  return _then(_CreatorModel(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,biography: freezed == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaintingImages {

 PaintingImageSize get web; PaintingImageSize? get print; PaintingImageSize? get full;
/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingImagesCopyWith<PaintingImages> get copyWith => _$PaintingImagesCopyWithImpl<PaintingImages>(this as PaintingImages, _$identity);

  /// Serializes this PaintingImages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingImages&&(identical(other.web, web) || other.web == web)&&(identical(other.print, print) || other.print == print)&&(identical(other.full, full) || other.full == full));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,web,print,full);

@override
String toString() {
  return 'PaintingImages(web: $web, print: $print, full: $full)';
}


}

/// @nodoc
abstract mixin class $PaintingImagesCopyWith<$Res>  {
  factory $PaintingImagesCopyWith(PaintingImages value, $Res Function(PaintingImages) _then) = _$PaintingImagesCopyWithImpl;
@useResult
$Res call({
 PaintingImageSize web, PaintingImageSize? print, PaintingImageSize? full
});


$PaintingImageSizeCopyWith<$Res> get web;$PaintingImageSizeCopyWith<$Res>? get print;$PaintingImageSizeCopyWith<$Res>? get full;

}
/// @nodoc
class _$PaintingImagesCopyWithImpl<$Res>
    implements $PaintingImagesCopyWith<$Res> {
  _$PaintingImagesCopyWithImpl(this._self, this._then);

  final PaintingImages _self;
  final $Res Function(PaintingImages) _then;

/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? web = null,Object? print = freezed,Object? full = freezed,}) {
  return _then(_self.copyWith(
web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PaintingImageSize,print: freezed == print ? _self.print : print // ignore: cast_nullable_to_non_nullable
as PaintingImageSize?,full: freezed == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as PaintingImageSize?,
  ));
}
/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res> get web {
  
  return $PaintingImageSizeCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res>? get print {
    if (_self.print == null) {
    return null;
  }

  return $PaintingImageSizeCopyWith<$Res>(_self.print!, (value) {
    return _then(_self.copyWith(print: value));
  });
}/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res>? get full {
    if (_self.full == null) {
    return null;
  }

  return $PaintingImageSizeCopyWith<$Res>(_self.full!, (value) {
    return _then(_self.copyWith(full: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaintingImages].
extension PaintingImagesPatterns on PaintingImages {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingImages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingImages() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingImages value)  $default,){
final _that = this;
switch (_that) {
case _PaintingImages():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingImages value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingImages() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaintingImageSize web,  PaintingImageSize? print,  PaintingImageSize? full)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingImages() when $default != null:
return $default(_that.web,_that.print,_that.full);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaintingImageSize web,  PaintingImageSize? print,  PaintingImageSize? full)  $default,) {final _that = this;
switch (_that) {
case _PaintingImages():
return $default(_that.web,_that.print,_that.full);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaintingImageSize web,  PaintingImageSize? print,  PaintingImageSize? full)?  $default,) {final _that = this;
switch (_that) {
case _PaintingImages() when $default != null:
return $default(_that.web,_that.print,_that.full);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaintingImages implements PaintingImages {
  const _PaintingImages({required this.web, this.print, this.full});
  factory _PaintingImages.fromJson(Map<String, dynamic> json) => _$PaintingImagesFromJson(json);

@override final  PaintingImageSize web;
@override final  PaintingImageSize? print;
@override final  PaintingImageSize? full;

/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingImagesCopyWith<_PaintingImages> get copyWith => __$PaintingImagesCopyWithImpl<_PaintingImages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaintingImagesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingImages&&(identical(other.web, web) || other.web == web)&&(identical(other.print, print) || other.print == print)&&(identical(other.full, full) || other.full == full));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,web,print,full);

@override
String toString() {
  return 'PaintingImages(web: $web, print: $print, full: $full)';
}


}

/// @nodoc
abstract mixin class _$PaintingImagesCopyWith<$Res> implements $PaintingImagesCopyWith<$Res> {
  factory _$PaintingImagesCopyWith(_PaintingImages value, $Res Function(_PaintingImages) _then) = __$PaintingImagesCopyWithImpl;
@override @useResult
$Res call({
 PaintingImageSize web, PaintingImageSize? print, PaintingImageSize? full
});


@override $PaintingImageSizeCopyWith<$Res> get web;@override $PaintingImageSizeCopyWith<$Res>? get print;@override $PaintingImageSizeCopyWith<$Res>? get full;

}
/// @nodoc
class __$PaintingImagesCopyWithImpl<$Res>
    implements _$PaintingImagesCopyWith<$Res> {
  __$PaintingImagesCopyWithImpl(this._self, this._then);

  final _PaintingImages _self;
  final $Res Function(_PaintingImages) _then;

/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? web = null,Object? print = freezed,Object? full = freezed,}) {
  return _then(_PaintingImages(
web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PaintingImageSize,print: freezed == print ? _self.print : print // ignore: cast_nullable_to_non_nullable
as PaintingImageSize?,full: freezed == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as PaintingImageSize?,
  ));
}

/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res> get web {
  
  return $PaintingImageSizeCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res>? get print {
    if (_self.print == null) {
    return null;
  }

  return $PaintingImageSizeCopyWith<$Res>(_self.print!, (value) {
    return _then(_self.copyWith(print: value));
  });
}/// Create a copy of PaintingImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<$Res>? get full {
    if (_self.full == null) {
    return null;
  }

  return $PaintingImageSizeCopyWith<$Res>(_self.full!, (value) {
    return _then(_self.copyWith(full: value));
  });
}
}


/// @nodoc
mixin _$PaintingImageSize {

 String get url; Object? get width;// Can be String or int in different API versions
 Object? get height;
/// Create a copy of PaintingImageSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingImageSizeCopyWith<PaintingImageSize> get copyWith => _$PaintingImageSizeCopyWithImpl<PaintingImageSize>(this as PaintingImageSize, _$identity);

  /// Serializes this PaintingImageSize to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingImageSize&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.width, width)&&const DeepCollectionEquality().equals(other.height, height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,const DeepCollectionEquality().hash(width),const DeepCollectionEquality().hash(height));

@override
String toString() {
  return 'PaintingImageSize(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $PaintingImageSizeCopyWith<$Res>  {
  factory $PaintingImageSizeCopyWith(PaintingImageSize value, $Res Function(PaintingImageSize) _then) = _$PaintingImageSizeCopyWithImpl;
@useResult
$Res call({
 String url, Object? width, Object? height
});




}
/// @nodoc
class _$PaintingImageSizeCopyWithImpl<$Res>
    implements $PaintingImageSizeCopyWith<$Res> {
  _$PaintingImageSizeCopyWithImpl(this._self, this._then);

  final PaintingImageSize _self;
  final $Res Function(PaintingImageSize) _then;

/// Create a copy of PaintingImageSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width ,height: freezed == height ? _self.height : height ,
  ));
}

}


/// Adds pattern-matching-related methods to [PaintingImageSize].
extension PaintingImageSizePatterns on PaintingImageSize {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingImageSize value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingImageSize() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingImageSize value)  $default,){
final _that = this;
switch (_that) {
case _PaintingImageSize():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingImageSize value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingImageSize() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  Object? width,  Object? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingImageSize() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  Object? width,  Object? height)  $default,) {final _that = this;
switch (_that) {
case _PaintingImageSize():
return $default(_that.url,_that.width,_that.height);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  Object? width,  Object? height)?  $default,) {final _that = this;
switch (_that) {
case _PaintingImageSize() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaintingImageSize implements PaintingImageSize {
  const _PaintingImageSize({required this.url, this.width, this.height});
  factory _PaintingImageSize.fromJson(Map<String, dynamic> json) => _$PaintingImageSizeFromJson(json);

@override final  String url;
@override final  Object? width;
// Can be String or int in different API versions
@override final  Object? height;

/// Create a copy of PaintingImageSize
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingImageSizeCopyWith<_PaintingImageSize> get copyWith => __$PaintingImageSizeCopyWithImpl<_PaintingImageSize>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaintingImageSizeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingImageSize&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.width, width)&&const DeepCollectionEquality().equals(other.height, height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,const DeepCollectionEquality().hash(width),const DeepCollectionEquality().hash(height));

@override
String toString() {
  return 'PaintingImageSize(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$PaintingImageSizeCopyWith<$Res> implements $PaintingImageSizeCopyWith<$Res> {
  factory _$PaintingImageSizeCopyWith(_PaintingImageSize value, $Res Function(_PaintingImageSize) _then) = __$PaintingImageSizeCopyWithImpl;
@override @useResult
$Res call({
 String url, Object? width, Object? height
});




}
/// @nodoc
class __$PaintingImageSizeCopyWithImpl<$Res>
    implements _$PaintingImageSizeCopyWith<$Res> {
  __$PaintingImageSizeCopyWithImpl(this._self, this._then);

  final _PaintingImageSize _self;
  final $Res Function(_PaintingImageSize) _then;

/// Create a copy of PaintingImageSize
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_PaintingImageSize(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width ,height: freezed == height ? _self.height : height ,
  ));
}


}

// dart format on
