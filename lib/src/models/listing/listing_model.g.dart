// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingModel _$ListingModelFromJson(Map<String, dynamic> json) =>
    _ListingModel(
      title: json['title'] as String,
      city: json['city'] as String,
      suburb: json['suburb'] as String,
      price: (json['price'] as num).toDouble(),
      listingAgent: UserModel.fromJson(
        json['listing_agent'] as Map<String, dynamic>,
      ),
      listingAgency: AgencyModel.fromJson(
        json['listing_agency'] as Map<String, dynamic>,
      ),
      description: json['description'] as String?,
      images: json['images'] as String?,
      id: json['id'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      listingImages: json['listingImages'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$ListingModelToJson(_ListingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'city': instance.city,
      'suburb': instance.suburb,
      'price': instance.price,
      'listing_agent': instance.listingAgent,
      'listing_agency': instance.listingAgency,
      'description': instance.description,
      'images': instance.images,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'listingImages': instance.listingImages,
    };
