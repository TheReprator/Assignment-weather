// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_result_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppResult<$T>()';
}


}

/// @nodoc
class $AppResultCopyWith<T,$Res>  {
$AppResultCopyWith(AppResult<T> _, $Res Function(AppResult<T>) __);
}


/// Adds pattern-matching-related methods to [AppResult].
extension AppResultPatterns<T> on AppResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppSuccess<T> value)?  success,TResult Function( AppFailure<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppSuccess() when success != null:
return success(_that);case AppFailure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppSuccess<T> value)  success,required TResult Function( AppFailure<T> value)  error,}){
final _that = this;
switch (_that) {
case AppSuccess():
return success(_that);case AppFailure():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppSuccess<T> value)?  success,TResult? Function( AppFailure<T> value)?  error,}){
final _that = this;
switch (_that) {
case AppSuccess() when success != null:
return success(_that);case AppFailure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppSuccess() when success != null:
return success(_that.data);case AppFailure() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case AppSuccess():
return success(_that.data);case AppFailure():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case AppSuccess() when success != null:
return success(_that.data);case AppFailure() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AppSuccess<T> implements AppResult<T> {
  const AppSuccess(this.data);
  

 final  T data;

/// Create a copy of AppResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSuccessCopyWith<T, AppSuccess<T>> get copyWith => _$AppSuccessCopyWithImpl<T, AppSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSuccessCopyWith<T,$Res> implements $AppResultCopyWith<T, $Res> {
  factory $AppSuccessCopyWith(AppSuccess<T> value, $Res Function(AppSuccess<T>) _then) = _$AppSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$AppSuccessCopyWithImpl<T,$Res>
    implements $AppSuccessCopyWith<T, $Res> {
  _$AppSuccessCopyWithImpl(this._self, this._then);

  final AppSuccess<T> _self;
  final $Res Function(AppSuccess<T>) _then;

/// Create a copy of AppResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(AppSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AppFailure<T> implements AppResult<T> {
  const AppFailure(this.message);
  

 final  String? message;

/// Create a copy of AppResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFailureCopyWith<T, AppFailure<T>> get copyWith => _$AppFailureCopyWithImpl<T, AppFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFailure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppResult<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppFailureCopyWith<T,$Res> implements $AppResultCopyWith<T, $Res> {
  factory $AppFailureCopyWith(AppFailure<T> value, $Res Function(AppFailure<T>) _then) = _$AppFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AppFailureCopyWithImpl<T,$Res>
    implements $AppFailureCopyWith<T, $Res> {
  _$AppFailureCopyWithImpl(this._self, this._then);

  final AppFailure<T> _self;
  final $Res Function(AppFailure<T>) _then;

/// Create a copy of AppResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(AppFailure<T>(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
