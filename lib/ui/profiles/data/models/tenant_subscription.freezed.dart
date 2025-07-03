// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantSubscription {

 String get tenantId; double get amountPaid; DateTime get paymentDate; int get appointmentsGranted; String get paypalOrderId; String? get paypalTransactionId; String get paymentStatus;
/// Create a copy of TenantSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantSubscriptionCopyWith<TenantSubscription> get copyWith => _$TenantSubscriptionCopyWithImpl<TenantSubscription>(this as TenantSubscription, _$identity);

  /// Serializes this TenantSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantSubscription&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.appointmentsGranted, appointmentsGranted) || other.appointmentsGranted == appointmentsGranted)&&(identical(other.paypalOrderId, paypalOrderId) || other.paypalOrderId == paypalOrderId)&&(identical(other.paypalTransactionId, paypalTransactionId) || other.paypalTransactionId == paypalTransactionId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,amountPaid,paymentDate,appointmentsGranted,paypalOrderId,paypalTransactionId,paymentStatus);

@override
String toString() {
  return 'TenantSubscription(tenantId: $tenantId, amountPaid: $amountPaid, paymentDate: $paymentDate, appointmentsGranted: $appointmentsGranted, paypalOrderId: $paypalOrderId, paypalTransactionId: $paypalTransactionId, paymentStatus: $paymentStatus)';
}


}

/// @nodoc
abstract mixin class $TenantSubscriptionCopyWith<$Res>  {
  factory $TenantSubscriptionCopyWith(TenantSubscription value, $Res Function(TenantSubscription) _then) = _$TenantSubscriptionCopyWithImpl;
@useResult
$Res call({
 String tenantId, double amountPaid, DateTime paymentDate, int appointmentsGranted, String paypalOrderId, String? paypalTransactionId, String paymentStatus
});




}
/// @nodoc
class _$TenantSubscriptionCopyWithImpl<$Res>
    implements $TenantSubscriptionCopyWith<$Res> {
  _$TenantSubscriptionCopyWithImpl(this._self, this._then);

  final TenantSubscription _self;
  final $Res Function(TenantSubscription) _then;

/// Create a copy of TenantSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? amountPaid = null,Object? paymentDate = null,Object? appointmentsGranted = null,Object? paypalOrderId = null,Object? paypalTransactionId = freezed,Object? paymentStatus = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,appointmentsGranted: null == appointmentsGranted ? _self.appointmentsGranted : appointmentsGranted // ignore: cast_nullable_to_non_nullable
as int,paypalOrderId: null == paypalOrderId ? _self.paypalOrderId : paypalOrderId // ignore: cast_nullable_to_non_nullable
as String,paypalTransactionId: freezed == paypalTransactionId ? _self.paypalTransactionId : paypalTransactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TenantSubscription implements TenantSubscription {
  const _TenantSubscription({required this.tenantId, required this.amountPaid, required this.paymentDate, required this.appointmentsGranted, required this.paypalOrderId, this.paypalTransactionId, required this.paymentStatus});
  factory _TenantSubscription.fromJson(Map<String, dynamic> json) => _$TenantSubscriptionFromJson(json);

@override final  String tenantId;
@override final  double amountPaid;
@override final  DateTime paymentDate;
@override final  int appointmentsGranted;
@override final  String paypalOrderId;
@override final  String? paypalTransactionId;
@override final  String paymentStatus;

/// Create a copy of TenantSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantSubscriptionCopyWith<_TenantSubscription> get copyWith => __$TenantSubscriptionCopyWithImpl<_TenantSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantSubscription&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.appointmentsGranted, appointmentsGranted) || other.appointmentsGranted == appointmentsGranted)&&(identical(other.paypalOrderId, paypalOrderId) || other.paypalOrderId == paypalOrderId)&&(identical(other.paypalTransactionId, paypalTransactionId) || other.paypalTransactionId == paypalTransactionId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,amountPaid,paymentDate,appointmentsGranted,paypalOrderId,paypalTransactionId,paymentStatus);

@override
String toString() {
  return 'TenantSubscription(tenantId: $tenantId, amountPaid: $amountPaid, paymentDate: $paymentDate, appointmentsGranted: $appointmentsGranted, paypalOrderId: $paypalOrderId, paypalTransactionId: $paypalTransactionId, paymentStatus: $paymentStatus)';
}


}

/// @nodoc
abstract mixin class _$TenantSubscriptionCopyWith<$Res> implements $TenantSubscriptionCopyWith<$Res> {
  factory _$TenantSubscriptionCopyWith(_TenantSubscription value, $Res Function(_TenantSubscription) _then) = __$TenantSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, double amountPaid, DateTime paymentDate, int appointmentsGranted, String paypalOrderId, String? paypalTransactionId, String paymentStatus
});




}
/// @nodoc
class __$TenantSubscriptionCopyWithImpl<$Res>
    implements _$TenantSubscriptionCopyWith<$Res> {
  __$TenantSubscriptionCopyWithImpl(this._self, this._then);

  final _TenantSubscription _self;
  final $Res Function(_TenantSubscription) _then;

/// Create a copy of TenantSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? amountPaid = null,Object? paymentDate = null,Object? appointmentsGranted = null,Object? paypalOrderId = null,Object? paypalTransactionId = freezed,Object? paymentStatus = null,}) {
  return _then(_TenantSubscription(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,appointmentsGranted: null == appointmentsGranted ? _self.appointmentsGranted : appointmentsGranted // ignore: cast_nullable_to_non_nullable
as int,paypalOrderId: null == paypalOrderId ? _self.paypalOrderId : paypalOrderId // ignore: cast_nullable_to_non_nullable
as String,paypalTransactionId: freezed == paypalTransactionId ? _self.paypalTransactionId : paypalTransactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
