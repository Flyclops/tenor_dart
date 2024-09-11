import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/models/models.dart';
import 'package:tenor_dart/src/utilities/utilities.dart';

part 'response.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable(explicitToJson: true)
class TenorResponse {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  @JsonKey(name: 'results')
  final List<TenorResult> results;

  @JsonKey(name: 'aspectRatioRange')
  final TenorAspectRatioRange aspectRatioRange;

  @JsonKey(name: 'contentFilter')
  final TenorContentFilter contentFilter;

  @JsonKey(name: 'endpoint')
  final TenorEndpoint? endpoint;

  @JsonKey(name: 'mediaFilter')
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
    this.mediaFilter = const [TenorMediaFormat.tinygif],
    this.next,
    this.parameters,
    this.timeout = const Duration(seconds: 5),
  });

  factory TenorResponse.fromJson(Map<String, dynamic> json) =>
      _$TenorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TenorResponseToJson(this);

  factory TenorResponse.fromString(String message) =>
      TenorResponse.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());

  Future<TenorResponse?> fetchNext({int limit = 1}) {
    return getGifs(
      endpoint!,
      timeout,
      parameters!,
      limit: limit,
      contentFilter: contentFilter,
      aspectRatioRange: aspectRatioRange,
      mediaFilter: mediaFilter,
      pos: next,
    );
  }
}
