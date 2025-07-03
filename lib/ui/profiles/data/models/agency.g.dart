// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  agencyId: json['agencyId'] as String,
  agencyName: json['agencyName'] as String,
  contactEmail: json['contactEmail'] as String,
  phoneNumber: json['phoneNumber'] as String,
  whatsappNumber: json['whatsappNumber'] as String?,
  address: json['address'] as String?,
  primarySuburb: json['primarySuburb'] as String,
  allowedSuburbs: (json['allowedSuburbs'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  parentAgencyId: json['parentAgencyId'] as String?,
  agencyLogo: json['agencyLogo'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'agencyId': instance.agencyId,
  'agencyName': instance.agencyName,
  'contactEmail': instance.contactEmail,
  'phoneNumber': instance.phoneNumber,
  'whatsappNumber': instance.whatsappNumber,
  'address': instance.address,
  'primarySuburb': instance.primarySuburb,
  'allowedSuburbs': instance.allowedSuburbs,
  'parentAgencyId': instance.parentAgencyId,
  'agencyLogo': instance.agencyLogo,
};
