// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Agency _$AgencyFromJson(
  Map<String, dynamic> json
) {
    return _User.fromJson(
      json
    );
}

/// @nodoc
mixin _$Agency {

 String get agencyId; String get agencyName; String get contactEmail; String get phoneNumber; String? get whatsappNumber; String? get address; String get primarySuburb; List<String> get allowedSuburbs; String? get parentAgencyId; String? get agencyLogo;
/// Create a copy of Agency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgencyCopyWith<Agency> get copyWith => _$AgencyCopyWithImpl<Agency>(this as Agency, _$identity);

  /// Serializes this Agency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Agency&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.primarySuburb, primarySuburb) || other.primarySuburb == primarySuburb)&&const DeepCollectionEquality().equals(other.allowedSuburbs, allowedSuburbs)&&(identical(other.parentAgencyId, parentAgencyId) || other.parentAgencyId == parentAgencyId)&&(identical(other.agencyLogo, agencyLogo) || other.agencyLogo == agencyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,agencyId,agencyName,contactEmail,phoneNumber,whatsappNumber,address,primarySuburb,const DeepCollectionEquality().hash(allowedSuburbs),parentAgencyId,agencyLogo);

@override
String toString() {
  return 'Agency(agencyId: $agencyId, agencyName: $agencyName, contactEmail: $contactEmail, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber, address: $address, primarySuburb: $primarySuburb, allowedSuburbs: $allowedSuburbs, parentAgencyId: $parentAgencyId, agencyLogo: $agencyLogo)';
}


}

/// @nodoc
abstract mixin class $AgencyCopyWith<$Res>  {
  factory $AgencyCopyWith(Agency value, $Res Function(Agency) _then) = _$AgencyCopyWithImpl;
@useResult
$Res call({
 String agencyId, String agencyName, String contactEmail, String phoneNumber, String? whatsappNumber, String? address, String primarySuburb, List<String> allowedSuburbs, String? parentAgencyId, String? agencyLogo
});




}
/// @nodoc
class _$AgencyCopyWithImpl<$Res>
    implements $AgencyCopyWith<$Res> {
  _$AgencyCopyWithImpl(this._self, this._then);

  final Agency _self;
  final $Res Function(Agency) _then;

/// Create a copy of Agency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agencyId = null,Object? agencyName = null,Object? contactEmail = null,Object? phoneNumber = null,Object? whatsappNumber = freezed,Object? address = freezed,Object? primarySuburb = null,Object? allowedSuburbs = null,Object? parentAgencyId = freezed,Object? agencyLogo = freezed,}) {
  return _then(_self.copyWith(
agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primarySuburb: null == primarySuburb ? _self.primarySuburb : primarySuburb // ignore: cast_nullable_to_non_nullable
as String,allowedSuburbs: null == allowedSuburbs ? _self.allowedSuburbs : allowedSuburbs // ignore: cast_nullable_to_non_nullable
as List<String>,parentAgencyId: freezed == parentAgencyId ? _self.parentAgencyId : parentAgencyId // ignore: cast_nullable_to_non_nullable
as String?,agencyLogo: freezed == agencyLogo ? _self.agencyLogo : agencyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements Agency {
  const _User({required this.agencyId, required this.agencyName, required this.contactEmail, required this.phoneNumber, this.whatsappNumber, this.address, required this.primarySuburb, required final  List<String> allowedSuburbs, this.parentAgencyId, this.agencyLogo}): _allowedSuburbs = allowedSuburbs;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String agencyId;
@override final  String agencyName;
@override final  String contactEmail;
@override final  String phoneNumber;
@override final  String? whatsappNumber;
@override final  String? address;
@override final  String primarySuburb;
 final  List<String> _allowedSuburbs;
@override List<String> get allowedSuburbs {
  if (_allowedSuburbs is EqualUnmodifiableListView) return _allowedSuburbs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedSuburbs);
}

@override final  String? parentAgencyId;
@override final  String? agencyLogo;

/// Create a copy of Agency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.primarySuburb, primarySuburb) || other.primarySuburb == primarySuburb)&&const DeepCollectionEquality().equals(other._allowedSuburbs, _allowedSuburbs)&&(identical(other.parentAgencyId, parentAgencyId) || other.parentAgencyId == parentAgencyId)&&(identical(other.agencyLogo, agencyLogo) || other.agencyLogo == agencyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,agencyId,agencyName,contactEmail,phoneNumber,whatsappNumber,address,primarySuburb,const DeepCollectionEquality().hash(_allowedSuburbs),parentAgencyId,agencyLogo);

@override
String toString() {
  return 'Agency(agencyId: $agencyId, agencyName: $agencyName, contactEmail: $contactEmail, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber, address: $address, primarySuburb: $primarySuburb, allowedSuburbs: $allowedSuburbs, parentAgencyId: $parentAgencyId, agencyLogo: $agencyLogo)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $AgencyCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String agencyId, String agencyName, String contactEmail, String phoneNumber, String? whatsappNumber, String? address, String primarySuburb, List<String> allowedSuburbs, String? parentAgencyId, String? agencyLogo
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of Agency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agencyId = null,Object? agencyName = null,Object? contactEmail = null,Object? phoneNumber = null,Object? whatsappNumber = freezed,Object? address = freezed,Object? primarySuburb = null,Object? allowedSuburbs = null,Object? parentAgencyId = freezed,Object? agencyLogo = freezed,}) {
  return _then(_User(
agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primarySuburb: null == primarySuburb ? _self.primarySuburb : primarySuburb // ignore: cast_nullable_to_non_nullable
as String,allowedSuburbs: null == allowedSuburbs ? _self._allowedSuburbs : allowedSuburbs // ignore: cast_nullable_to_non_nullable
as List<String>,parentAgencyId: freezed == parentAgencyId ? _self.parentAgencyId : parentAgencyId // ignore: cast_nullable_to_non_nullable
as String?,agencyLogo: freezed == agencyLogo ? _self.agencyLogo : agencyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
