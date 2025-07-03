// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tenant {

 String get tenantName; String get email; String get phoneNumber; String? get whatsappNumber;
/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantCopyWith<Tenant> get copyWith => _$TenantCopyWithImpl<Tenant>(this as Tenant, _$identity);

  /// Serializes this Tenant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tenant&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantName,email,phoneNumber,whatsappNumber);

@override
String toString() {
  return 'Tenant(tenantName: $tenantName, email: $email, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber)';
}


}

/// @nodoc
abstract mixin class $TenantCopyWith<$Res>  {
  factory $TenantCopyWith(Tenant value, $Res Function(Tenant) _then) = _$TenantCopyWithImpl;
@useResult
$Res call({
 String tenantName, String email, String phoneNumber, String? whatsappNumber
});




}
/// @nodoc
class _$TenantCopyWithImpl<$Res>
    implements $TenantCopyWith<$Res> {
  _$TenantCopyWithImpl(this._self, this._then);

  final Tenant _self;
  final $Res Function(Tenant) _then;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantName = null,Object? email = null,Object? phoneNumber = null,Object? whatsappNumber = freezed,}) {
  return _then(_self.copyWith(
tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Tenant implements Tenant {
  const _Tenant({required this.tenantName, required this.email, required this.phoneNumber, this.whatsappNumber});
  factory _Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);

@override final  String tenantName;
@override final  String email;
@override final  String phoneNumber;
@override final  String? whatsappNumber;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantCopyWith<_Tenant> get copyWith => __$TenantCopyWithImpl<_Tenant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tenant&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantName,email,phoneNumber,whatsappNumber);

@override
String toString() {
  return 'Tenant(tenantName: $tenantName, email: $email, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber)';
}


}

/// @nodoc
abstract mixin class _$TenantCopyWith<$Res> implements $TenantCopyWith<$Res> {
  factory _$TenantCopyWith(_Tenant value, $Res Function(_Tenant) _then) = __$TenantCopyWithImpl;
@override @useResult
$Res call({
 String tenantName, String email, String phoneNumber, String? whatsappNumber
});




}
/// @nodoc
class __$TenantCopyWithImpl<$Res>
    implements _$TenantCopyWith<$Res> {
  __$TenantCopyWithImpl(this._self, this._then);

  final _Tenant _self;
  final $Res Function(_Tenant) _then;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantName = null,Object? email = null,Object? phoneNumber = null,Object? whatsappNumber = freezed,}) {
  return _then(_Tenant(
tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
