import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/models/models.dart';
import 'package:tenor_dart/src/http_client.dart';

part 'response.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable(explicitToJson: true)
class TenorResponse {
  static const _encoder = JsonEncoder.withIndent('  ');

  @JsonKey(name: 'results')
  final List<TenorResult> results;

  @JsonKey(name: 'aspect_ratio_range')
  final TenorAspectRatioRange aspectRatioRange;

  @JsonKey(name: 'content_filter')
  final TenorContentFilter contentFilter;

  @JsonKey(name: 'endpoint')
  final TenorEndpoint? endpoint;

  @JsonKey(name: 'media_filter')
  final List<String>? mediaFilter;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'parameters')
  final String? parameters;

  @JsonKey(name: 'timeout')
  final Duration timeout;

  TenorResponse({
    required this.results,
    this.aspectRatioRange = TenorAspectRatioRange.all,
    this.contentFilter = TenorContentFilter.off,
    this.endpoint,
    this.mediaFilter = const [TenorMediaFormat.tinyGif],
    this.next,
    this.parameters,
    this.timeout = const Duration(seconds: 5),
  });

  factory TenorResponse.fromJson(Map<String, dynamic> json) =>
      _$TenorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TenorResponseToJson(this);

  // TODO look into sticker and random on fetchNext
  Future<TenorResponse?> fetchNext({
    int limit = 1,
    TenorHttpClient httpClient = const TenorHttpClient(),
  }) {
    return httpClient.getGifs(
      endpoint!,
      timeout,
      parameters!,
      aspectRatioRange: aspectRatioRange,
      contentFilter: contentFilter,
      limit: limit,
      mediaFilter: mediaFilter,
      pos: next,
    );
  }

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
