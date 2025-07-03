import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_subscription.freezed.dart';

part 'tenant_subscription.g.dart';

@freezed
abstract class TenantSubscription with _$TenantSubscription {
  const factory TenantSubscription({
    required String tenantId,
    required double amountPaid,
    required DateTime paymentDate,
    required int appointmentsGranted,
    required String paypalOrderId,
    String? paypalTransactionId,
    required String paymentStatus, // "Pending", "Completed", "Failed"
  }) = _TenantSubscription;

  factory TenantSubscription.fromJson(Map<String, dynamic> json) =>
      _$TenantSubscriptionFromJson(json);
}
