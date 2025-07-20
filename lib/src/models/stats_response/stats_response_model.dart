import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_response_model.freezed.dart';
part 'stats_response_model.g.dart';

@freezed
abstract class StatsResponse with _$StatsResponse {
  const factory StatsResponse({
    required int users,
    required int agencies,
    required int listings,
    required int images,
    required double averagePrice,
    required Map<String, int> usersByRole,
  }) = _StatsResponse;

  factory StatsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatsResponseFromJson(json);
}
