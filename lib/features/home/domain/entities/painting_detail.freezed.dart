// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painting_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaintingDetail {

 int get id; String get title; String get author; String get year; String get imageUrl; double get aspectRatio; String? get description; String? get technique; List<String>? get culture; String? get measurements; String? get department; String? get authorBiography;
/// Create a copy of PaintingDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaintingDetailCopyWith<PaintingDetail> get copyWith => _$PaintingDetailCopyWithImpl<PaintingDetail>(this as PaintingDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaintingDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.year, year) || other.year == year)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.description, description) || other.description == description)&&(identical(other.technique, technique) || other.technique == technique)&&const DeepCollectionEquality().equals(other.culture, culture)&&(identical(other.measurements, measurements) || other.measurements == measurements)&&(identical(other.department, department) || other.department == department)&&(identical(other.authorBiography, authorBiography) || other.authorBiography == authorBiography));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,author,year,imageUrl,aspectRatio,description,technique,const DeepCollectionEquality().hash(culture),measurements,department,authorBiography);

@override
String toString() {
  return 'PaintingDetail(id: $id, title: $title, author: $author, year: $year, imageUrl: $imageUrl, aspectRatio: $aspectRatio, description: $description, technique: $technique, culture: $culture, measurements: $measurements, department: $department, authorBiography: $authorBiography)';
}


}

/// @nodoc
abstract mixin class $PaintingDetailCopyWith<$Res>  {
  factory $PaintingDetailCopyWith(PaintingDetail value, $Res Function(PaintingDetail) _then) = _$PaintingDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title, String author, String year, String imageUrl, double aspectRatio, String? description, String? technique, List<String>? culture, String? measurements, String? department, String? authorBiography
});




}
/// @nodoc
class _$PaintingDetailCopyWithImpl<$Res>
    implements $PaintingDetailCopyWith<$Res> {
  _$PaintingDetailCopyWithImpl(this._self, this._then);

  final PaintingDetail _self;
  final $Res Function(PaintingDetail) _then;

/// Create a copy of PaintingDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? year = null,Object? imageUrl = null,Object? aspectRatio = null,Object? description = freezed,Object? technique = freezed,Object? culture = freezed,Object? measurements = freezed,Object? department = freezed,Object? authorBiography = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,technique: freezed == technique ? _self.technique : technique // ignore: cast_nullable_to_non_nullable
as String?,culture: freezed == culture ? _self.culture : culture // ignore: cast_nullable_to_non_nullable
as List<String>?,measurements: freezed == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,authorBiography: freezed == authorBiography ? _self.authorBiography : authorBiography // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaintingDetail].
extension PaintingDetailPatterns on PaintingDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaintingDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaintingDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaintingDetail value)  $default,){
final _that = this;
switch (_that) {
case _PaintingDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaintingDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PaintingDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String author,  String year,  String imageUrl,  double aspectRatio,  String? description,  String? technique,  List<String>? culture,  String? measurements,  String? department,  String? authorBiography)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaintingDetail() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.year,_that.imageUrl,_that.aspectRatio,_that.description,_that.technique,_that.culture,_that.measurements,_that.department,_that.authorBiography);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String author,  String year,  String imageUrl,  double aspectRatio,  String? description,  String? technique,  List<String>? culture,  String? measurements,  String? department,  String? authorBiography)  $default,) {final _that = this;
switch (_that) {
case _PaintingDetail():
return $default(_that.id,_that.title,_that.author,_that.year,_that.imageUrl,_that.aspectRatio,_that.description,_that.technique,_that.culture,_that.measurements,_that.department,_that.authorBiography);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String author,  String year,  String imageUrl,  double aspectRatio,  String? description,  String? technique,  List<String>? culture,  String? measurements,  String? department,  String? authorBiography)?  $default,) {final _that = this;
switch (_that) {
case _PaintingDetail() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.year,_that.imageUrl,_that.aspectRatio,_that.description,_that.technique,_that.culture,_that.measurements,_that.department,_that.authorBiography);case _:
  return null;

}
}

}

/// @nodoc


class _PaintingDetail implements PaintingDetail {
  const _PaintingDetail({required this.id, required this.title, required this.author, required this.year, required this.imageUrl, required this.aspectRatio, this.description, this.technique, final  List<String>? culture, this.measurements, this.department, this.authorBiography}): _culture = culture;
  

@override final  int id;
@override final  String title;
@override final  String author;
@override final  String year;
@override final  String imageUrl;
@override final  double aspectRatio;
@override final  String? description;
@override final  String? technique;
 final  List<String>? _culture;
@override List<String>? get culture {
  final value = _culture;
  if (value == null) return null;
  if (_culture is EqualUnmodifiableListView) return _culture;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? measurements;
@override final  String? department;
@override final  String? authorBiography;

/// Create a copy of PaintingDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintingDetailCopyWith<_PaintingDetail> get copyWith => __$PaintingDetailCopyWithImpl<_PaintingDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaintingDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.year, year) || other.year == year)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.description, description) || other.description == description)&&(identical(other.technique, technique) || other.technique == technique)&&const DeepCollectionEquality().equals(other._culture, _culture)&&(identical(other.measurements, measurements) || other.measurements == measurements)&&(identical(other.department, department) || other.department == department)&&(identical(other.authorBiography, authorBiography) || other.authorBiography == authorBiography));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,author,year,imageUrl,aspectRatio,description,technique,const DeepCollectionEquality().hash(_culture),measurements,department,authorBiography);

@override
String toString() {
  return 'PaintingDetail(id: $id, title: $title, author: $author, year: $year, imageUrl: $imageUrl, aspectRatio: $aspectRatio, description: $description, technique: $technique, culture: $culture, measurements: $measurements, department: $department, authorBiography: $authorBiography)';
}


}

/// @nodoc
abstract mixin class _$PaintingDetailCopyWith<$Res> implements $PaintingDetailCopyWith<$Res> {
  factory _$PaintingDetailCopyWith(_PaintingDetail value, $Res Function(_PaintingDetail) _then) = __$PaintingDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String author, String year, String imageUrl, double aspectRatio, String? description, String? technique, List<String>? culture, String? measurements, String? department, String? authorBiography
});




}
/// @nodoc
class __$PaintingDetailCopyWithImpl<$Res>
    implements _$PaintingDetailCopyWith<$Res> {
  __$PaintingDetailCopyWithImpl(this._self, this._then);

  final _PaintingDetail _self;
  final $Res Function(_PaintingDetail) _then;

/// Create a copy of PaintingDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? year = null,Object? imageUrl = null,Object? aspectRatio = null,Object? description = freezed,Object? technique = freezed,Object? culture = freezed,Object? measurements = freezed,Object? department = freezed,Object? authorBiography = freezed,}) {
  return _then(_PaintingDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,technique: freezed == technique ? _self.technique : technique // ignore: cast_nullable_to_non_nullable
as String?,culture: freezed == culture ? _self._culture : culture // ignore: cast_nullable_to_non_nullable
as List<String>?,measurements: freezed == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,authorBiography: freezed == authorBiography ? _self.authorBiography : authorBiography // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
