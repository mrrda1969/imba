// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatsResponse _$StatsResponseFromJson(Map<String, dynamic> json) =>
    _StatsResponse(
      users: (json['users'] as num).toInt(),
      agencies: (json['agencies'] as num).toInt(),
      listings: (json['listings'] as num).toInt(),
      images: (json['images'] as num).toInt(),
      averagePrice: (json['averagePrice'] as num).toDouble(),
      usersByRole: Map<String, int>.from(json['usersByRole'] as Map),
    );

Map<String, dynamic> _$StatsResponseToJson(_StatsResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'agencies': instance.agencies,
      'listings': instance.listings,
      'images': instance.images,
      'averagePrice': instance.averagePrice,
      'usersByRole': instance.usersByRole,
    };
