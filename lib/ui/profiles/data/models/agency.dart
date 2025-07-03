import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency.freezed.dart';

part 'agency.g.dart';

@freezed
abstract class Agency with _$Agency {
  const factory Agency({
    required String agencyId,
    required String agencyName,
    required String contactEmail,
    required String phoneNumber,
    String? whatsappNumber,
    String? address,
    required String primarySuburb,
    required List<String> allowedSuburbs,
    String? parentAgencyId,
    String? agencyLogo,
  }) = _User;

  factory Agency.fromJson(Map<String, dynamic> json) => _$AgencyFromJson(json);
}
