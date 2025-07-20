// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingModel {

 String get title; String get city; String get suburb; double get price;@JsonKey(name: 'listing_agent') UserModel get listingAgent;@JsonKey(name: 'listing_agency') AgencyModel get listingAgency; String? get description; String? get images; String? get id; DateTime? get createdAt; DateTime? get updatedAt; List<dynamic> get listingImages;
/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingModelCopyWith<ListingModel> get copyWith => _$ListingModelCopyWithImpl<ListingModel>(this as ListingModel, _$identity);

  /// Serializes this ListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingModel&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.suburb, suburb) || other.suburb == suburb)&&(identical(other.price, price) || other.price == price)&&(identical(other.listingAgent, listingAgent) || other.listingAgent == listingAgent)&&(identical(other.listingAgency, listingAgency) || other.listingAgency == listingAgency)&&(identical(other.description, description) || other.description == description)&&(identical(other.images, images) || other.images == images)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.listingImages, listingImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,city,suburb,price,listingAgent,listingAgency,description,images,id,createdAt,updatedAt,const DeepCollectionEquality().hash(listingImages));

@override
String toString() {
  return 'ListingModel(title: $title, city: $city, suburb: $suburb, price: $price, listingAgent: $listingAgent, listingAgency: $listingAgency, description: $description, images: $images, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, listingImages: $listingImages)';
}


}

/// @nodoc
abstract mixin class $ListingModelCopyWith<$Res>  {
  factory $ListingModelCopyWith(ListingModel value, $Res Function(ListingModel) _then) = _$ListingModelCopyWithImpl;
@useResult
$Res call({
 String title, String city, String suburb, double price,@JsonKey(name: 'listing_agent') UserModel listingAgent,@JsonKey(name: 'listing_agency') AgencyModel listingAgency, String? description, String? images, String? id, DateTime? createdAt, DateTime? updatedAt, List<dynamic> listingImages
});


$UserModelCopyWith<$Res> get listingAgent;$AgencyModelCopyWith<$Res> get listingAgency;

}
/// @nodoc
class _$ListingModelCopyWithImpl<$Res>
    implements $ListingModelCopyWith<$Res> {
  _$ListingModelCopyWithImpl(this._self, this._then);

  final ListingModel _self;
  final $Res Function(ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? city = null,Object? suburb = null,Object? price = null,Object? listingAgent = null,Object? listingAgency = null,Object? description = freezed,Object? images = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? listingImages = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,suburb: null == suburb ? _self.suburb : suburb // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,listingAgent: null == listingAgent ? _self.listingAgent : listingAgent // ignore: cast_nullable_to_non_nullable
as UserModel,listingAgency: null == listingAgency ? _self.listingAgency : listingAgency // ignore: cast_nullable_to_non_nullable
as AgencyModel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,listingImages: null == listingImages ? _self.listingImages : listingImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get listingAgent {
  
  return $UserModelCopyWith<$Res>(_self.listingAgent, (value) {
    return _then(_self.copyWith(listingAgent: value));
  });
}/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgencyModelCopyWith<$Res> get listingAgency {
  
  return $AgencyModelCopyWith<$Res>(_self.listingAgency, (value) {
    return _then(_self.copyWith(listingAgency: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListingModel].
extension ListingModelPatterns on ListingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingModel value)  $default,){
final _that = this;
switch (_that) {
case _ListingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String city,  String suburb,  double price, @JsonKey(name: 'listing_agent')  UserModel listingAgent, @JsonKey(name: 'listing_agency')  AgencyModel listingAgency,  String? description,  String? images,  String? id,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic> listingImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.title,_that.city,_that.suburb,_that.price,_that.listingAgent,_that.listingAgency,_that.description,_that.images,_that.id,_that.createdAt,_that.updatedAt,_that.listingImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String city,  String suburb,  double price, @JsonKey(name: 'listing_agent')  UserModel listingAgent, @JsonKey(name: 'listing_agency')  AgencyModel listingAgency,  String? description,  String? images,  String? id,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic> listingImages)  $default,) {final _that = this;
switch (_that) {
case _ListingModel():
return $default(_that.title,_that.city,_that.suburb,_that.price,_that.listingAgent,_that.listingAgency,_that.description,_that.images,_that.id,_that.createdAt,_that.updatedAt,_that.listingImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String city,  String suburb,  double price, @JsonKey(name: 'listing_agent')  UserModel listingAgent, @JsonKey(name: 'listing_agency')  AgencyModel listingAgency,  String? description,  String? images,  String? id,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic> listingImages)?  $default,) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.title,_that.city,_that.suburb,_that.price,_that.listingAgent,_that.listingAgency,_that.description,_that.images,_that.id,_that.createdAt,_that.updatedAt,_that.listingImages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingModel implements ListingModel {
  const _ListingModel({required this.title, required this.city, required this.suburb, required this.price, @JsonKey(name: 'listing_agent') required this.listingAgent, @JsonKey(name: 'listing_agency') required this.listingAgency, this.description, this.images, this.id, this.createdAt, this.updatedAt, final  List<dynamic> listingImages = const []}): _listingImages = listingImages;
  factory _ListingModel.fromJson(Map<String, dynamic> json) => _$ListingModelFromJson(json);

@override final  String title;
@override final  String city;
@override final  String suburb;
@override final  double price;
@override@JsonKey(name: 'listing_agent') final  UserModel listingAgent;
@override@JsonKey(name: 'listing_agency') final  AgencyModel listingAgency;
@override final  String? description;
@override final  String? images;
@override final  String? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<dynamic> _listingImages;
@override@JsonKey() List<dynamic> get listingImages {
  if (_listingImages is EqualUnmodifiableListView) return _listingImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listingImages);
}


/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingModelCopyWith<_ListingModel> get copyWith => __$ListingModelCopyWithImpl<_ListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingModel&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.suburb, suburb) || other.suburb == suburb)&&(identical(other.price, price) || other.price == price)&&(identical(other.listingAgent, listingAgent) || other.listingAgent == listingAgent)&&(identical(other.listingAgency, listingAgency) || other.listingAgency == listingAgency)&&(identical(other.description, description) || other.description == description)&&(identical(other.images, images) || other.images == images)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._listingImages, _listingImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,city,suburb,price,listingAgent,listingAgency,description,images,id,createdAt,updatedAt,const DeepCollectionEquality().hash(_listingImages));

@override
String toString() {
  return 'ListingModel(title: $title, city: $city, suburb: $suburb, price: $price, listingAgent: $listingAgent, listingAgency: $listingAgency, description: $description, images: $images, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, listingImages: $listingImages)';
}


}

/// @nodoc
abstract mixin class _$ListingModelCopyWith<$Res> implements $ListingModelCopyWith<$Res> {
  factory _$ListingModelCopyWith(_ListingModel value, $Res Function(_ListingModel) _then) = __$ListingModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String city, String suburb, double price,@JsonKey(name: 'listing_agent') UserModel listingAgent,@JsonKey(name: 'listing_agency') AgencyModel listingAgency, String? description, String? images, String? id, DateTime? createdAt, DateTime? updatedAt, List<dynamic> listingImages
});


@override $UserModelCopyWith<$Res> get listingAgent;@override $AgencyModelCopyWith<$Res> get listingAgency;

}
/// @nodoc
class __$ListingModelCopyWithImpl<$Res>
    implements _$ListingModelCopyWith<$Res> {
  __$ListingModelCopyWithImpl(this._self, this._then);

  final _ListingModel _self;
  final $Res Function(_ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? city = null,Object? suburb = null,Object? price = null,Object? listingAgent = null,Object? listingAgency = null,Object? description = freezed,Object? images = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? listingImages = null,}) {
  return _then(_ListingModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,suburb: null == suburb ? _self.suburb : suburb // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,listingAgent: null == listingAgent ? _self.listingAgent : listingAgent // ignore: cast_nullable_to_non_nullable
as UserModel,listingAgency: null == listingAgency ? _self.listingAgency : listingAgency // ignore: cast_nullable_to_non_nullable
as AgencyModel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,listingImages: null == listingImages ? _self._listingImages : listingImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get listingAgent {
  
  return $UserModelCopyWith<$Res>(_self.listingAgent, (value) {
    return _then(_self.copyWith(listingAgent: value));
  });
}/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgencyModelCopyWith<$Res> get listingAgency {
  
  return $AgencyModelCopyWith<$Res>(_self.listingAgency, (value) {
    return _then(_self.copyWith(listingAgency: value));
  });
}
}

// dart format on
