// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgencyModel _$AgencyModelFromJson(Map<String, dynamic> json) => _AgencyModel(
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  whatsappNumber: json['whatsapp_number'] as String?,
  address: json['address'] as String?,
  primarySuburb: json['primary_suburb'] as String?,
  allowedSuburbs:
      (json['allowed_suburbs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  parentAgencyId: json['parent_agency_id'] as String?,
  logo: json['logo'] as String?,
  id: json['id'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AgencyModelToJson(_AgencyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp_number': instance.whatsappNumber,
      'address': instance.address,
      'primary_suburb': instance.primarySuburb,
      'allowed_suburbs': instance.allowedSuburbs,
      'parent_agency_id': instance.parentAgencyId,
      'logo': instance.logo,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
