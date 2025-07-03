// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Listing {

@JsonKey(name: 'name') String get id;@JsonKey(name: 'listing_name') String get title; String get city; String get surburb;@JsonKey(fromJson: _toDouble) double get price;@JsonKey(name: 'listing_agent') String get listingAgent; String get description; List<ImageModel> get images; String? get agencyId;
/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingCopyWith<Listing> get copyWith => _$ListingCopyWithImpl<Listing>(this as Listing, _$identity);

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Listing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.surburb, surburb) || other.surburb == surburb)&&(identical(other.price, price) || other.price == price)&&(identical(other.listingAgent, listingAgent) || other.listingAgent == listingAgent)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,city,surburb,price,listingAgent,description,const DeepCollectionEquality().hash(images),agencyId);

@override
String toString() {
  return 'Listing(id: $id, title: $title, city: $city, surburb: $surburb, price: $price, listingAgent: $listingAgent, description: $description, images: $images, agencyId: $agencyId)';
}


}

/// @nodoc
abstract mixin class $ListingCopyWith<$Res>  {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) _then) = _$ListingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String id,@JsonKey(name: 'listing_name') String title, String city, String surburb,@JsonKey(fromJson: _toDouble) double price,@JsonKey(name: 'listing_agent') String listingAgent, String description, List<ImageModel> images, String? agencyId
});




}
/// @nodoc
class _$ListingCopyWithImpl<$Res>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._self, this._then);

  final Listing _self;
  final $Res Function(Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? city = null,Object? surburb = null,Object? price = null,Object? listingAgent = null,Object? description = null,Object? images = null,Object? agencyId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,surburb: null == surburb ? _self.surburb : surburb // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,listingAgent: null == listingAgent ? _self.listingAgent : listingAgent // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,agencyId: freezed == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Listing implements Listing {
  const _Listing({@JsonKey(name: 'name') required this.id, @JsonKey(name: 'listing_name') required this.title, required this.city, required this.surburb, @JsonKey(fromJson: _toDouble) required this.price, @JsonKey(name: 'listing_agent') required this.listingAgent, required this.description, final  List<ImageModel> images = const [], this.agencyId}): _images = images;
  factory _Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

@override@JsonKey(name: 'name') final  String id;
@override@JsonKey(name: 'listing_name') final  String title;
@override final  String city;
@override final  String surburb;
@override@JsonKey(fromJson: _toDouble) final  double price;
@override@JsonKey(name: 'listing_agent') final  String listingAgent;
@override final  String description;
 final  List<ImageModel> _images;
@override@JsonKey() List<ImageModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String? agencyId;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingCopyWith<_Listing> get copyWith => __$ListingCopyWithImpl<_Listing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.surburb, surburb) || other.surburb == surburb)&&(identical(other.price, price) || other.price == price)&&(identical(other.listingAgent, listingAgent) || other.listingAgent == listingAgent)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,city,surburb,price,listingAgent,description,const DeepCollectionEquality().hash(_images),agencyId);

@override
String toString() {
  return 'Listing(id: $id, title: $title, city: $city, surburb: $surburb, price: $price, listingAgent: $listingAgent, description: $description, images: $images, agencyId: $agencyId)';
}


}

/// @nodoc
abstract mixin class _$ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$ListingCopyWith(_Listing value, $Res Function(_Listing) _then) = __$ListingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String id,@JsonKey(name: 'listing_name') String title, String city, String surburb,@JsonKey(fromJson: _toDouble) double price,@JsonKey(name: 'listing_agent') String listingAgent, String description, List<ImageModel> images, String? agencyId
});




}
/// @nodoc
class __$ListingCopyWithImpl<$Res>
    implements _$ListingCopyWith<$Res> {
  __$ListingCopyWithImpl(this._self, this._then);

  final _Listing _self;
  final $Res Function(_Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? city = null,Object? surburb = null,Object? price = null,Object? listingAgent = null,Object? description = null,Object? images = null,Object? agencyId = freezed,}) {
  return _then(_Listing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,surburb: null == surburb ? _self.surburb : surburb // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,listingAgent: null == listingAgent ? _self.listingAgent : listingAgent // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,agencyId: freezed == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
