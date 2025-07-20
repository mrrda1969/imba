import 'package:freezed_annotation/freezed_annotation.dart';
import 'listing_model.dart';

part 'paginated_listing_response.freezed.dart';

part 'paginated_listing_response.g.dart';

@freezed
abstract class PaginatedListingsResponse with _$PaginatedListingsResponse {
  const factory PaginatedListingsResponse({
    required List<ListingModel> listings,
    required int totalPages,
    required int currentPage,
    required int total,
  }) = _PaginatedListingsResponse;

  factory PaginatedListingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedListingsResponseFromJson(json);
}
