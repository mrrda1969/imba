import 'package:freezed_annotation/freezed_annotation.dart';
import 'image_model.dart';

part 'listing.freezed.dart';

part 'listing.g.dart';

@freezed
abstract class Listing with _$Listing {
  const factory Listing({
    @JsonKey(name: 'name') required String id,
    @JsonKey(name: 'listing_name') required String title,
    required String city,
    required String surburb,
    @JsonKey(fromJson: _toDouble) required double price,
    @JsonKey(name: 'listing_agent') required String listingAgent,
    required String description,
    @Default([]) List<ImageModel> images,
    String? agencyId,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);
}

double _toDouble(dynamic value) =>
    value is int ? value.toDouble() : value as double;
