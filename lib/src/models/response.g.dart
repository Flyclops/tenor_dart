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
      aspectRatioRange: $enumDecodeNullable(
              _$TenorAspectRatioRangeEnumMap, json['aspectRatioRange']) ??
          TenorAspectRatioRange.all,
      contentFilter: $enumDecodeNullable(
              _$TenorContentFilterEnumMap, json['contentFilter']) ??
          TenorContentFilter.off,
      endpoint: $enumDecodeNullable(_$TenorEndpointEnumMap, json['endpoint']),
      mediaFilter: (json['mediaFilter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [TenorMediaFormat.tinygif],
      next: json['next'] as String?,
      parameters: json['parameters'] as String?,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 5)
          : Duration(microseconds: (json['timeout'] as num).toInt()),
    );

Map<String, dynamic> _$TenorResponseToJson(TenorResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'aspectRatioRange':
          _$TenorAspectRatioRangeEnumMap[instance.aspectRatioRange]!,
      'contentFilter': _$TenorContentFilterEnumMap[instance.contentFilter]!,
      'endpoint': _$TenorEndpointEnumMap[instance.endpoint],
      'mediaFilter': instance.mediaFilter,
      'next': instance.next,
      'parameters': instance.parameters,
      'timeout': instance.timeout.inMicroseconds,
    };

const _$TenorAspectRatioRangeEnumMap = {
  TenorAspectRatioRange.all: 'all',
  TenorAspectRatioRange.wide: 'wide',
  TenorAspectRatioRange.standard: 'standard',
};

const _$TenorContentFilterEnumMap = {
  TenorContentFilter.high: 'high',
  TenorContentFilter.medium: 'medium',
  TenorContentFilter.low: 'low',
  TenorContentFilter.off: 'off',
};

const _$TenorEndpointEnumMap = {
  TenorEndpoint.autocomplete: 'autocomplete',
  TenorEndpoint.categories: 'categories',
  TenorEndpoint.featured: 'featured',
  TenorEndpoint.posts: 'posts',
  TenorEndpoint.registershare: 'registershare',
  TenorEndpoint.search: 'search',
  TenorEndpoint.search_suggestions: 'search_suggestions',
  TenorEndpoint.trending_terms: 'trending_terms',
};
