import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imba/src/models/agency/agency_model.dart';
import 'package:imba/src/models/user/user_model.dart';

part 'listing_model.freezed.dart';

part 'listing_model.g.dart';

@freezed
abstract class ListingModel with _$ListingModel {
  const factory ListingModel({
    required String title,
    required String city,
    required String suburb,
    required double price,
    @JsonKey(name: 'listing_agent') required UserModel listingAgent,
    @JsonKey(name: 'listing_agency') required AgencyModel listingAgency,
    String? description,
    String? images,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<dynamic> listingImages,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, dynamic> json) =>
      _$ListingModelFromJson(json);
}
