// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatsResponse {

 int get users; int get agencies; int get listings; int get images; double get averagePrice; Map<String, int> get usersByRole;
/// Create a copy of StatsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsResponseCopyWith<StatsResponse> get copyWith => _$StatsResponseCopyWithImpl<StatsResponse>(this as StatsResponse, _$identity);

  /// Serializes this StatsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsResponse&&(identical(other.users, users) || other.users == users)&&(identical(other.agencies, agencies) || other.agencies == agencies)&&(identical(other.listings, listings) || other.listings == listings)&&(identical(other.images, images) || other.images == images)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&const DeepCollectionEquality().equals(other.usersByRole, usersByRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,users,agencies,listings,images,averagePrice,const DeepCollectionEquality().hash(usersByRole));

@override
String toString() {
  return 'StatsResponse(users: $users, agencies: $agencies, listings: $listings, images: $images, averagePrice: $averagePrice, usersByRole: $usersByRole)';
}


}

/// @nodoc
abstract mixin class $StatsResponseCopyWith<$Res>  {
  factory $StatsResponseCopyWith(StatsResponse value, $Res Function(StatsResponse) _then) = _$StatsResponseCopyWithImpl;
@useResult
$Res call({
 int users, int agencies, int listings, int images, double averagePrice, Map<String, int> usersByRole
});




}
/// @nodoc
class _$StatsResponseCopyWithImpl<$Res>
    implements $StatsResponseCopyWith<$Res> {
  _$StatsResponseCopyWithImpl(this._self, this._then);

  final StatsResponse _self;
  final $Res Function(StatsResponse) _then;

/// Create a copy of StatsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? agencies = null,Object? listings = null,Object? images = null,Object? averagePrice = null,Object? usersByRole = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,agencies: null == agencies ? _self.agencies : agencies // ignore: cast_nullable_to_non_nullable
as int,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,usersByRole: null == usersByRole ? _self.usersByRole : usersByRole // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsResponse].
extension StatsResponsePatterns on StatsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsResponse value)  $default,){
final _that = this;
switch (_that) {
case _StatsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StatsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int users,  int agencies,  int listings,  int images,  double averagePrice,  Map<String, int> usersByRole)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsResponse() when $default != null:
return $default(_that.users,_that.agencies,_that.listings,_that.images,_that.averagePrice,_that.usersByRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int users,  int agencies,  int listings,  int images,  double averagePrice,  Map<String, int> usersByRole)  $default,) {final _that = this;
switch (_that) {
case _StatsResponse():
return $default(_that.users,_that.agencies,_that.listings,_that.images,_that.averagePrice,_that.usersByRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int users,  int agencies,  int listings,  int images,  double averagePrice,  Map<String, int> usersByRole)?  $default,) {final _that = this;
switch (_that) {
case _StatsResponse() when $default != null:
return $default(_that.users,_that.agencies,_that.listings,_that.images,_that.averagePrice,_that.usersByRole);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatsResponse implements StatsResponse {
  const _StatsResponse({required this.users, required this.agencies, required this.listings, required this.images, required this.averagePrice, required final  Map<String, int> usersByRole}): _usersByRole = usersByRole;
  factory _StatsResponse.fromJson(Map<String, dynamic> json) => _$StatsResponseFromJson(json);

@override final  int users;
@override final  int agencies;
@override final  int listings;
@override final  int images;
@override final  double averagePrice;
 final  Map<String, int> _usersByRole;
@override Map<String, int> get usersByRole {
  if (_usersByRole is EqualUnmodifiableMapView) return _usersByRole;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_usersByRole);
}


/// Create a copy of StatsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsResponseCopyWith<_StatsResponse> get copyWith => __$StatsResponseCopyWithImpl<_StatsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsResponse&&(identical(other.users, users) || other.users == users)&&(identical(other.agencies, agencies) || other.agencies == agencies)&&(identical(other.listings, listings) || other.listings == listings)&&(identical(other.images, images) || other.images == images)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&const DeepCollectionEquality().equals(other._usersByRole, _usersByRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,users,agencies,listings,images,averagePrice,const DeepCollectionEquality().hash(_usersByRole));

@override
String toString() {
  return 'StatsResponse(users: $users, agencies: $agencies, listings: $listings, images: $images, averagePrice: $averagePrice, usersByRole: $usersByRole)';
}


}

/// @nodoc
abstract mixin class _$StatsResponseCopyWith<$Res> implements $StatsResponseCopyWith<$Res> {
  factory _$StatsResponseCopyWith(_StatsResponse value, $Res Function(_StatsResponse) _then) = __$StatsResponseCopyWithImpl;
@override @useResult
$Res call({
 int users, int agencies, int listings, int images, double averagePrice, Map<String, int> usersByRole
});




}
/// @nodoc
class __$StatsResponseCopyWithImpl<$Res>
    implements _$StatsResponseCopyWith<$Res> {
  __$StatsResponseCopyWithImpl(this._self, this._then);

  final _StatsResponse _self;
  final $Res Function(_StatsResponse) _then;

/// Create a copy of StatsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? agencies = null,Object? listings = null,Object? images = null,Object? averagePrice = null,Object? usersByRole = null,}) {
  return _then(_StatsResponse(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,agencies: null == agencies ? _self.agencies : agencies // ignore: cast_nullable_to_non_nullable
as int,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,usersByRole: null == usersByRole ? _self._usersByRole : usersByRole // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
