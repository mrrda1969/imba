import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency_model.freezed.dart';

part 'agency_model.g.dart';

@freezed
abstract class AgencyModel with _$AgencyModel {
  const factory AgencyModel({
    required String name,
    required String email,
    String? phone,
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    String? address,
    @JsonKey(name: 'primary_suburb') String? primarySuburb,
    @JsonKey(name: 'allowed_suburbs') List<String>? allowedSuburbs,
    @JsonKey(name: 'parent_agency_id') String? parentAgencyId,
    String? logo,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AgencyModel;

  factory AgencyModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyModelFromJson(json);
}
