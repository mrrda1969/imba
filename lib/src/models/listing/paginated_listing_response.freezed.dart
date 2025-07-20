// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_listing_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedListingsResponse {

 List<ListingModel> get listings; int get totalPages; int get currentPage; int get total;
/// Create a copy of PaginatedListingsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedListingsResponseCopyWith<PaginatedListingsResponse> get copyWith => _$PaginatedListingsResponseCopyWithImpl<PaginatedListingsResponse>(this as PaginatedListingsResponse, _$identity);

  /// Serializes this PaginatedListingsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedListingsResponse&&const DeepCollectionEquality().equals(other.listings, listings)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(listings),totalPages,currentPage,total);

@override
String toString() {
  return 'PaginatedListingsResponse(listings: $listings, totalPages: $totalPages, currentPage: $currentPage, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginatedListingsResponseCopyWith<$Res>  {
  factory $PaginatedListingsResponseCopyWith(PaginatedListingsResponse value, $Res Function(PaginatedListingsResponse) _then) = _$PaginatedListingsResponseCopyWithImpl;
@useResult
$Res call({
 List<ListingModel> listings, int totalPages, int currentPage, int total
});




}
/// @nodoc
class _$PaginatedListingsResponseCopyWithImpl<$Res>
    implements $PaginatedListingsResponseCopyWith<$Res> {
  _$PaginatedListingsResponseCopyWithImpl(this._self, this._then);

  final PaginatedListingsResponse _self;
  final $Res Function(PaginatedListingsResponse) _then;

/// Create a copy of PaginatedListingsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listings = null,Object? totalPages = null,Object? currentPage = null,Object? total = null,}) {
  return _then(_self.copyWith(
listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedListingsResponse].
extension PaginatedListingsResponsePatterns on PaginatedListingsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedListingsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedListingsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedListingsResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedListingsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedListingsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedListingsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListingModel> listings,  int totalPages,  int currentPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedListingsResponse() when $default != null:
return $default(_that.listings,_that.totalPages,_that.currentPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListingModel> listings,  int totalPages,  int currentPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginatedListingsResponse():
return $default(_that.listings,_that.totalPages,_that.currentPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListingModel> listings,  int totalPages,  int currentPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedListingsResponse() when $default != null:
return $default(_that.listings,_that.totalPages,_that.currentPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedListingsResponse implements PaginatedListingsResponse {
  const _PaginatedListingsResponse({required final  List<ListingModel> listings, required this.totalPages, required this.currentPage, required this.total}): _listings = listings;
  factory _PaginatedListingsResponse.fromJson(Map<String, dynamic> json) => _$PaginatedListingsResponseFromJson(json);

 final  List<ListingModel> _listings;
@override List<ListingModel> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}

@override final  int totalPages;
@override final  int currentPage;
@override final  int total;

/// Create a copy of PaginatedListingsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedListingsResponseCopyWith<_PaginatedListingsResponse> get copyWith => __$PaginatedListingsResponseCopyWithImpl<_PaginatedListingsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedListingsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedListingsResponse&&const DeepCollectionEquality().equals(other._listings, _listings)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listings),totalPages,currentPage,total);

@override
String toString() {
  return 'PaginatedListingsResponse(listings: $listings, totalPages: $totalPages, currentPage: $currentPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginatedListingsResponseCopyWith<$Res> implements $PaginatedListingsResponseCopyWith<$Res> {
  factory _$PaginatedListingsResponseCopyWith(_PaginatedListingsResponse value, $Res Function(_PaginatedListingsResponse) _then) = __$PaginatedListingsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ListingModel> listings, int totalPages, int currentPage, int total
});




}
/// @nodoc
class __$PaginatedListingsResponseCopyWithImpl<$Res>
    implements _$PaginatedListingsResponseCopyWith<$Res> {
  __$PaginatedListingsResponseCopyWithImpl(this._self, this._then);

  final _PaginatedListingsResponse _self;
  final $Res Function(_PaginatedListingsResponse) _then;

/// Create a copy of PaginatedListingsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listings = null,Object? totalPages = null,Object? currentPage = null,Object? total = null,}) {
  return _then(_PaginatedListingsResponse(
listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
