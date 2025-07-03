// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantSubscription _$TenantSubscriptionFromJson(Map<String, dynamic> json) =>
    _TenantSubscription(
      tenantId: json['tenantId'] as String,
      amountPaid: (json['amountPaid'] as num).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      appointmentsGranted: (json['appointmentsGranted'] as num).toInt(),
      paypalOrderId: json['paypalOrderId'] as String,
      paypalTransactionId: json['paypalTransactionId'] as String?,
      paymentStatus: json['paymentStatus'] as String,
    );

Map<String, dynamic> _$TenantSubscriptionToJson(_TenantSubscription instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'amountPaid': instance.amountPaid,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'appointmentsGranted': instance.appointmentsGranted,
      'paypalOrderId': instance.paypalOrderId,
      'paypalTransactionId': instance.paypalTransactionId,
      'paymentStatus': instance.paymentStatus,
    };
