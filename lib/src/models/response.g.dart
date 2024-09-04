// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorResponse _$TenorResponseFromJson(Map<String, dynamic> json) =>
    TenorResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => TenorResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpoint: $enumDecodeNullable(_$EndpointEnumMap, json['endpoint']),
      keys: json['keys'] as String?,
      next: json['next'] as String?,
      contentFilter: $enumDecodeNullable(
              _$TenorContentFilterEnumMap, json['contentFilter']) ??
          TenorContentFilter.off,
      mediaFilter: (json['mediaFilter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [TenorMediaFormat.tinygif],
      aspectRatioRange: $enumDecodeNullable(
              _$TenorAspectRatioRangeEnumMap, json['aspectRatioRange']) ??
          TenorAspectRatioRange.all,
    );

Map<String, dynamic> _$TenorResponseToJson(TenorResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'contentFilter': _$TenorContentFilterEnumMap[instance.contentFilter]!,
      'keys': instance.keys,
      'mediaFilter': instance.mediaFilter,
      'aspectRatioRange':
          _$TenorAspectRatioRangeEnumMap[instance.aspectRatioRange]!,
      'endpoint': _$EndpointEnumMap[instance.endpoint],
    };

const _$EndpointEnumMap = {
  Endpoint.autocomplete: 'autocomplete',
  Endpoint.categories: 'categories',
  Endpoint.featured: 'featured',
  Endpoint.posts: 'posts',
  Endpoint.registershare: 'registershare',
  Endpoint.search: 'search',
  Endpoint.search_suggestions: 'search_suggestions',
  Endpoint.trending_terms: 'trending_terms',
};

const _$TenorContentFilterEnumMap = {
  TenorContentFilter.high: 'high',
  TenorContentFilter.medium: 'medium',
  TenorContentFilter.low: 'low',
  TenorContentFilter.off: 'off',
};

const _$TenorAspectRatioRangeEnumMap = {
  TenorAspectRatioRange.all: 'all',
  TenorAspectRatioRange.wide: 'wide',
  TenorAspectRatioRange.standard: 'standard',
};
