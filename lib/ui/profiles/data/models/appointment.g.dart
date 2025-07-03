// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
  appointmentId: json['appointmentId'] as String,
  tenantId: json['tenantId'] as String,
  agencyId: json['agencyId'] as String,
  propertyId: json['propertyId'] as String,
  status: json['status'] as String,
  scheduledDate: DateTime.parse(json['scheduledDate'] as String),
);

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'tenantId': instance.tenantId,
      'agencyId': instance.agencyId,
      'propertyId': instance.propertyId,
      'status': instance.status,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
    };
