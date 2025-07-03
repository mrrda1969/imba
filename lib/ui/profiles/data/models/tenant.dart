import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant.freezed.dart';

part 'tenant.g.dart';

@freezed
abstract class Tenant with _$Tenant {
  const factory Tenant({
    required String tenantName,
    required String email,
    required String phoneNumber,
    String? whatsappNumber,
  }) = _Tenant;

  factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);
}
