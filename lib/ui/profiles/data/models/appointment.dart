import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';

part 'appointment.g.dart';

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    required String appointmentId,
    required String tenantId,
    required String agencyId,
    required String propertyId,
    required String status, // "Scheduled", "Completed"
    required DateTime scheduledDate,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
