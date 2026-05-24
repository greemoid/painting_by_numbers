// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_painting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePaintingState {

 QuantizationType get quantizationType; int get customColorsCount; bool get isQuantizing;
/// Create a copy of CreatePaintingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaintingStateCopyWith<CreatePaintingState> get copyWith => _$CreatePaintingStateCopyWithImpl<CreatePaintingState>(this as CreatePaintingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaintingState&&(identical(other.quantizationType, quantizationType) || other.quantizationType == quantizationType)&&(identical(other.customColorsCount, customColorsCount) || other.customColorsCount == customColorsCount)&&(identical(other.isQuantizing, isQuantizing) || other.isQuantizing == isQuantizing));
}


@override
int get hashCode => Object.hash(runtimeType,quantizationType,customColorsCount,isQuantizing);

@override
String toString() {
  return 'CreatePaintingState(quantizationType: $quantizationType, customColorsCount: $customColorsCount, isQuantizing: $isQuantizing)';
}


}

/// @nodoc
abstract mixin class $CreatePaintingStateCopyWith<$Res>  {
  factory $CreatePaintingStateCopyWith(CreatePaintingState value, $Res Function(CreatePaintingState) _then) = _$CreatePaintingStateCopyWithImpl;
@useResult
$Res call({
 QuantizationType quantizationType, int customColorsCount, bool isQuantizing
});




}
/// @nodoc
class _$CreatePaintingStateCopyWithImpl<$Res>
    implements $CreatePaintingStateCopyWith<$Res> {
  _$CreatePaintingStateCopyWithImpl(this._self, this._then);

  final CreatePaintingState _self;
  final $Res Function(CreatePaintingState) _then;

/// Create a copy of CreatePaintingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantizationType = null,Object? customColorsCount = null,Object? isQuantizing = null,}) {
  return _then(_self.copyWith(
quantizationType: null == quantizationType ? _self.quantizationType : quantizationType // ignore: cast_nullable_to_non_nullable
as QuantizationType,customColorsCount: null == customColorsCount ? _self.customColorsCount : customColorsCount // ignore: cast_nullable_to_non_nullable
as int,isQuantizing: null == isQuantizing ? _self.isQuantizing : isQuantizing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePaintingState].
extension CreatePaintingStatePatterns on CreatePaintingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePaintingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePaintingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePaintingState value)  $default,){
final _that = this;
switch (_that) {
case _CreatePaintingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePaintingState value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePaintingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuantizationType quantizationType,  int customColorsCount,  bool isQuantizing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePaintingState() when $default != null:
return $default(_that.quantizationType,_that.customColorsCount,_that.isQuantizing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuantizationType quantizationType,  int customColorsCount,  bool isQuantizing)  $default,) {final _that = this;
switch (_that) {
case _CreatePaintingState():
return $default(_that.quantizationType,_that.customColorsCount,_that.isQuantizing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuantizationType quantizationType,  int customColorsCount,  bool isQuantizing)?  $default,) {final _that = this;
switch (_that) {
case _CreatePaintingState() when $default != null:
return $default(_that.quantizationType,_that.customColorsCount,_that.isQuantizing);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePaintingState implements CreatePaintingState {
  const _CreatePaintingState({this.quantizationType = QuantizationType.many, this.customColorsCount = 25, this.isQuantizing = false});
  

@override@JsonKey() final  QuantizationType quantizationType;
@override@JsonKey() final  int customColorsCount;
@override@JsonKey() final  bool isQuantizing;

/// Create a copy of CreatePaintingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePaintingStateCopyWith<_CreatePaintingState> get copyWith => __$CreatePaintingStateCopyWithImpl<_CreatePaintingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePaintingState&&(identical(other.quantizationType, quantizationType) || other.quantizationType == quantizationType)&&(identical(other.customColorsCount, customColorsCount) || other.customColorsCount == customColorsCount)&&(identical(other.isQuantizing, isQuantizing) || other.isQuantizing == isQuantizing));
}


@override
int get hashCode => Object.hash(runtimeType,quantizationType,customColorsCount,isQuantizing);

@override
String toString() {
  return 'CreatePaintingState(quantizationType: $quantizationType, customColorsCount: $customColorsCount, isQuantizing: $isQuantizing)';
}


}

/// @nodoc
abstract mixin class _$CreatePaintingStateCopyWith<$Res> implements $CreatePaintingStateCopyWith<$Res> {
  factory _$CreatePaintingStateCopyWith(_CreatePaintingState value, $Res Function(_CreatePaintingState) _then) = __$CreatePaintingStateCopyWithImpl;
@override @useResult
$Res call({
 QuantizationType quantizationType, int customColorsCount, bool isQuantizing
});




}
/// @nodoc
class __$CreatePaintingStateCopyWithImpl<$Res>
    implements _$CreatePaintingStateCopyWith<$Res> {
  __$CreatePaintingStateCopyWithImpl(this._self, this._then);

  final _CreatePaintingState _self;
  final $Res Function(_CreatePaintingState) _then;

/// Create a copy of CreatePaintingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantizationType = null,Object? customColorsCount = null,Object? isQuantizing = null,}) {
  return _then(_CreatePaintingState(
quantizationType: null == quantizationType ? _self.quantizationType : quantizationType // ignore: cast_nullable_to_non_nullable
as QuantizationType,customColorsCount: null == customColorsCount ? _self.customColorsCount : customColorsCount // ignore: cast_nullable_to_non_nullable
as int,isQuantizing: null == isQuantizing ? _self.isQuantizing : isQuantizing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
