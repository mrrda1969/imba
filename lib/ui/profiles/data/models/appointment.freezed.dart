// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {

 String get appointmentId; String get tenantId; String get agencyId; String get propertyId; String get status;// "Scheduled", "Completed"
 DateTime get scheduledDate;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,tenantId,agencyId,propertyId,status,scheduledDate);

@override
String toString() {
  return 'Appointment(appointmentId: $appointmentId, tenantId: $tenantId, agencyId: $agencyId, propertyId: $propertyId, status: $status, scheduledDate: $scheduledDate)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String appointmentId, String tenantId, String agencyId, String propertyId, String status, DateTime scheduledDate
});




}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointmentId = null,Object? tenantId = null,Object? agencyId = null,Object? propertyId = null,Object? status = null,Object? scheduledDate = null,}) {
  return _then(_self.copyWith(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Appointment implements Appointment {
  const _Appointment({required this.appointmentId, required this.tenantId, required this.agencyId, required this.propertyId, required this.status, required this.scheduledDate});
  factory _Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

@override final  String appointmentId;
@override final  String tenantId;
@override final  String agencyId;
@override final  String propertyId;
@override final  String status;
// "Scheduled", "Completed"
@override final  DateTime scheduledDate;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,tenantId,agencyId,propertyId,status,scheduledDate);

@override
String toString() {
  return 'Appointment(appointmentId: $appointmentId, tenantId: $tenantId, agencyId: $agencyId, propertyId: $propertyId, status: $status, scheduledDate: $scheduledDate)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String appointmentId, String tenantId, String agencyId, String propertyId, String status, DateTime scheduledDate
});




}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointmentId = null,Object? tenantId = null,Object? agencyId = null,Object? propertyId = null,Object? status = null,Object? scheduledDate = null,}) {
  return _then(_Appointment(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
