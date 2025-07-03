// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageModel {

 String get id; String get url;@JsonKey(name: 'property_listing_id') String get propertyListingId;
/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageModelCopyWith<ImageModel> get copyWith => _$ImageModelCopyWithImpl<ImageModel>(this as ImageModel, _$identity);

  /// Serializes this ImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.propertyListingId, propertyListingId) || other.propertyListingId == propertyListingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,propertyListingId);

@override
String toString() {
  return 'ImageModel(id: $id, url: $url, propertyListingId: $propertyListingId)';
}


}

/// @nodoc
abstract mixin class $ImageModelCopyWith<$Res>  {
  factory $ImageModelCopyWith(ImageModel value, $Res Function(ImageModel) _then) = _$ImageModelCopyWithImpl;
@useResult
$Res call({
 String id, String url,@JsonKey(name: 'property_listing_id') String propertyListingId
});




}
/// @nodoc
class _$ImageModelCopyWithImpl<$Res>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._self, this._then);

  final ImageModel _self;
  final $Res Function(ImageModel) _then;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? propertyListingId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,propertyListingId: null == propertyListingId ? _self.propertyListingId : propertyListingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ImageModel implements ImageModel {
  const _ImageModel({required this.id, required this.url, @JsonKey(name: 'property_listing_id') required this.propertyListingId});
  factory _ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

@override final  String id;
@override final  String url;
@override@JsonKey(name: 'property_listing_id') final  String propertyListingId;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageModelCopyWith<_ImageModel> get copyWith => __$ImageModelCopyWithImpl<_ImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.propertyListingId, propertyListingId) || other.propertyListingId == propertyListingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,propertyListingId);

@override
String toString() {
  return 'ImageModel(id: $id, url: $url, propertyListingId: $propertyListingId)';
}


}

/// @nodoc
abstract mixin class _$ImageModelCopyWith<$Res> implements $ImageModelCopyWith<$Res> {
  factory _$ImageModelCopyWith(_ImageModel value, $Res Function(_ImageModel) _then) = __$ImageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String url,@JsonKey(name: 'property_listing_id') String propertyListingId
});




}
/// @nodoc
class __$ImageModelCopyWithImpl<$Res>
    implements _$ImageModelCopyWith<$Res> {
  __$ImageModelCopyWithImpl(this._self, this._then);

  final _ImageModel _self;
  final $Res Function(_ImageModel) _then;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? propertyListingId = null,}) {
  return _then(_ImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,propertyListingId: null == propertyListingId ? _self.propertyListingId : propertyListingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
