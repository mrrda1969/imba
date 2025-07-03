// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Listing _$ListingFromJson(Map<String, dynamic> json) => _Listing(
  id: json['name'] as String,
  title: json['listing_name'] as String,
  city: json['city'] as String,
  surburb: json['surburb'] as String,
  price: _toDouble(json['price']),
  listingAgent: json['listing_agent'] as String,
  description: json['description'] as String,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  agencyId: json['agencyId'] as String?,
);

Map<String, dynamic> _$ListingToJson(_Listing instance) => <String, dynamic>{
  'name': instance.id,
  'listing_name': instance.title,
  'city': instance.city,
  'surburb': instance.surburb,
  'price': instance.price,
  'listing_agent': instance.listingAgent,
  'description': instance.description,
  'images': instance.images,
  'agencyId': instance.agencyId,
};
