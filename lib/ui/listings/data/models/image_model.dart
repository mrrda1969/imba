import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

part 'image_model.g.dart';

@freezed
abstract class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String id,
    required String url,
    @JsonKey(name: 'property_listing_id') required String propertyListingId,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
