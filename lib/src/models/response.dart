import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/service/gif_fetcher.dart';
import 'package:tenor_dart/tenor_dart.dart';

part 'response.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable(explicitToJson: true)
class TenorResponse {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  @JsonKey(name: 'results')
  final List<TenorResult> results;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'contentFilter')
  final TenorContentFilter contentFilter;

  @JsonKey(name: 'keys')
  final String? keys;

  @JsonKey(name: 'mediaFilter')
  final List<String>? mediaFilter;

  @JsonKey(name: 'aspectRatioRange')
  final TenorAspectRatioRange aspectRatioRange;

  @JsonKey(name: 'endpoint')
  final Endpoint? endpoint;

  TenorResponse({
    required this.results,
    this.endpoint,
    this.keys,
    this.next,
    this.contentFilter = TenorContentFilter.off,
    this.mediaFilter = const [TenorMediaFormat.tinygif],
    this.aspectRatioRange = TenorAspectRatioRange.all,
  });

  factory TenorResponse.fromJson(Map<String, dynamic> json) =>
      _$TenorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TenorResponseToJson(this);

  factory TenorResponse.fromString(String message) =>
      TenorResponse.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());

  Future<TenorResponse?> fetchNext({int limit = 1}) {
    return privateRequestGif(
      endpoint!,
      keys!,
      limit: limit,
      contentFilter: contentFilter,
      aspectRatioRange: aspectRatioRange,
      mediaFilter: mediaFilter,
      pos: next,
    );
  }
}
