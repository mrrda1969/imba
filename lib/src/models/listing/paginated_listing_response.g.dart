// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedListingsResponse _$PaginatedListingsResponseFromJson(
  Map<String, dynamic> json,
) => _PaginatedListingsResponse(
  listings:
      (json['listings'] as List<dynamic>)
          .map((e) => ListingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  currentPage: (json['currentPage'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedListingsResponseToJson(
  _PaginatedListingsResponse instance,
) => <String, dynamic>{
  'listings': instance.listings,
  'totalPages': instance.totalPages,
  'currentPage': instance.currentPage,
  'total': instance.total,
};
