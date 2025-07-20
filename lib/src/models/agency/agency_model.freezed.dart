// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgencyModel {

 String get name; String get email; String? get phone;@JsonKey(name: 'whatsapp_number') String? get whatsappNumber; String? get address;@JsonKey(name: 'primary_suburb') String? get primarySuburb;@JsonKey(name: 'allowed_suburbs') List<String>? get allowedSuburbs;@JsonKey(name: 'parent_agency_id') String? get parentAgencyId; String? get logo; String? get id; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of AgencyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgencyModelCopyWith<AgencyModel> get copyWith => _$AgencyModelCopyWithImpl<AgencyModel>(this as AgencyModel, _$identity);

  /// Serializes this AgencyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgencyModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.primarySuburb, primarySuburb) || other.primarySuburb == primarySuburb)&&const DeepCollectionEquality().equals(other.allowedSuburbs, allowedSuburbs)&&(identical(other.parentAgencyId, parentAgencyId) || other.parentAgencyId == parentAgencyId)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,whatsappNumber,address,primarySuburb,const DeepCollectionEquality().hash(allowedSuburbs),parentAgencyId,logo,id,createdAt,updatedAt);

@override
String toString() {
  return 'AgencyModel(name: $name, email: $email, phone: $phone, whatsappNumber: $whatsappNumber, address: $address, primarySuburb: $primarySuburb, allowedSuburbs: $allowedSuburbs, parentAgencyId: $parentAgencyId, logo: $logo, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AgencyModelCopyWith<$Res>  {
  factory $AgencyModelCopyWith(AgencyModel value, $Res Function(AgencyModel) _then) = _$AgencyModelCopyWithImpl;
@useResult
$Res call({
 String name, String email, String? phone,@JsonKey(name: 'whatsapp_number') String? whatsappNumber, String? address,@JsonKey(name: 'primary_suburb') String? primarySuburb,@JsonKey(name: 'allowed_suburbs') List<String>? allowedSuburbs,@JsonKey(name: 'parent_agency_id') String? parentAgencyId, String? logo, String? id, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AgencyModelCopyWithImpl<$Res>
    implements $AgencyModelCopyWith<$Res> {
  _$AgencyModelCopyWithImpl(this._self, this._then);

  final AgencyModel _self;
  final $Res Function(AgencyModel) _then;

/// Create a copy of AgencyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? phone = freezed,Object? whatsappNumber = freezed,Object? address = freezed,Object? primarySuburb = freezed,Object? allowedSuburbs = freezed,Object? parentAgencyId = freezed,Object? logo = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primarySuburb: freezed == primarySuburb ? _self.primarySuburb : primarySuburb // ignore: cast_nullable_to_non_nullable
as String?,allowedSuburbs: freezed == allowedSuburbs ? _self.allowedSuburbs : allowedSuburbs // ignore: cast_nullable_to_non_nullable
as List<String>?,parentAgencyId: freezed == parentAgencyId ? _self.parentAgencyId : parentAgencyId // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgencyModel].
extension AgencyModelPatterns on AgencyModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgencyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgencyModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgencyModel value)  $default,){
final _that = this;
switch (_that) {
case _AgencyModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgencyModel value)?  $default,){
final _that = this;
switch (_that) {
case _AgencyModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String? phone, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String? address, @JsonKey(name: 'primary_suburb')  String? primarySuburb, @JsonKey(name: 'allowed_suburbs')  List<String>? allowedSuburbs, @JsonKey(name: 'parent_agency_id')  String? parentAgencyId,  String? logo,  String? id,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgencyModel() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.whatsappNumber,_that.address,_that.primarySuburb,_that.allowedSuburbs,_that.parentAgencyId,_that.logo,_that.id,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String? phone, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String? address, @JsonKey(name: 'primary_suburb')  String? primarySuburb, @JsonKey(name: 'allowed_suburbs')  List<String>? allowedSuburbs, @JsonKey(name: 'parent_agency_id')  String? parentAgencyId,  String? logo,  String? id,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AgencyModel():
return $default(_that.name,_that.email,_that.phone,_that.whatsappNumber,_that.address,_that.primarySuburb,_that.allowedSuburbs,_that.parentAgencyId,_that.logo,_that.id,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String? phone, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String? address, @JsonKey(name: 'primary_suburb')  String? primarySuburb, @JsonKey(name: 'allowed_suburbs')  List<String>? allowedSuburbs, @JsonKey(name: 'parent_agency_id')  String? parentAgencyId,  String? logo,  String? id,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AgencyModel() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.whatsappNumber,_that.address,_that.primarySuburb,_that.allowedSuburbs,_that.parentAgencyId,_that.logo,_that.id,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgencyModel implements AgencyModel {
  const _AgencyModel({required this.name, required this.email, this.phone, @JsonKey(name: 'whatsapp_number') this.whatsappNumber, this.address, @JsonKey(name: 'primary_suburb') this.primarySuburb, @JsonKey(name: 'allowed_suburbs') final  List<String>? allowedSuburbs, @JsonKey(name: 'parent_agency_id') this.parentAgencyId, this.logo, this.id, this.createdAt, this.updatedAt}): _allowedSuburbs = allowedSuburbs;
  factory _AgencyModel.fromJson(Map<String, dynamic> json) => _$AgencyModelFromJson(json);

@override final  String name;
@override final  String email;
@override final  String? phone;
@override@JsonKey(name: 'whatsapp_number') final  String? whatsappNumber;
@override final  String? address;
@override@JsonKey(name: 'primary_suburb') final  String? primarySuburb;
 final  List<String>? _allowedSuburbs;
@override@JsonKey(name: 'allowed_suburbs') List<String>? get allowedSuburbs {
  final value = _allowedSuburbs;
  if (value == null) return null;
  if (_allowedSuburbs is EqualUnmodifiableListView) return _allowedSuburbs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'parent_agency_id') final  String? parentAgencyId;
@override final  String? logo;
@override final  String? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of AgencyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgencyModelCopyWith<_AgencyModel> get copyWith => __$AgencyModelCopyWithImpl<_AgencyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgencyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgencyModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.primarySuburb, primarySuburb) || other.primarySuburb == primarySuburb)&&const DeepCollectionEquality().equals(other._allowedSuburbs, _allowedSuburbs)&&(identical(other.parentAgencyId, parentAgencyId) || other.parentAgencyId == parentAgencyId)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,whatsappNumber,address,primarySuburb,const DeepCollectionEquality().hash(_allowedSuburbs),parentAgencyId,logo,id,createdAt,updatedAt);

@override
String toString() {
  return 'AgencyModel(name: $name, email: $email, phone: $phone, whatsappNumber: $whatsappNumber, address: $address, primarySuburb: $primarySuburb, allowedSuburbs: $allowedSuburbs, parentAgencyId: $parentAgencyId, logo: $logo, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AgencyModelCopyWith<$Res> implements $AgencyModelCopyWith<$Res> {
  factory _$AgencyModelCopyWith(_AgencyModel value, $Res Function(_AgencyModel) _then) = __$AgencyModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String? phone,@JsonKey(name: 'whatsapp_number') String? whatsappNumber, String? address,@JsonKey(name: 'primary_suburb') String? primarySuburb,@JsonKey(name: 'allowed_suburbs') List<String>? allowedSuburbs,@JsonKey(name: 'parent_agency_id') String? parentAgencyId, String? logo, String? id, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AgencyModelCopyWithImpl<$Res>
    implements _$AgencyModelCopyWith<$Res> {
  __$AgencyModelCopyWithImpl(this._self, this._then);

  final _AgencyModel _self;
  final $Res Function(_AgencyModel) _then;

/// Create a copy of AgencyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = freezed,Object? whatsappNumber = freezed,Object? address = freezed,Object? primarySuburb = freezed,Object? allowedSuburbs = freezed,Object? parentAgencyId = freezed,Object? logo = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AgencyModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primarySuburb: freezed == primarySuburb ? _self.primarySuburb : primarySuburb // ignore: cast_nullable_to_non_nullable
as String?,allowedSuburbs: freezed == allowedSuburbs ? _self._allowedSuburbs : allowedSuburbs // ignore: cast_nullable_to_non_nullable
as List<String>?,parentAgencyId: freezed == parentAgencyId ? _self.parentAgencyId : parentAgencyId // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
