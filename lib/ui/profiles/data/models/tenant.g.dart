// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tenant _$TenantFromJson(Map<String, dynamic> json) => _Tenant(
  tenantName: json['tenantName'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  whatsappNumber: json['whatsappNumber'] as String?,
);

Map<String, dynamic> _$TenantToJson(_Tenant instance) => <String, dynamic>{
  'tenantName': instance.tenantName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'whatsappNumber': instance.whatsappNumber,
};
