// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => _ImageModel(
  id: json['id'] as String,
  url: json['url'] as String,
  propertyListingId: json['property_listing_id'] as String,
);

Map<String, dynamic> _$ImageModelToJson(_ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'property_listing_id': instance.propertyListingId,
    };
