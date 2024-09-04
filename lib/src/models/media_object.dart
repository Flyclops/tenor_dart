import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'media_object.g.dart';

/// Based on [media response object](https://developers.google.com/tenor/guides/response-objects-and-errors#media-object) from the Tenor API.
@JsonSerializable()
class TenorMediaObject {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  /// A URL to the media source
  @JsonKey(name: 'url')
  final String url;

  /// Width and height of the media in pixels
  @JsonKey(name: 'dims')
  final List<int> dims;

  /// Represents the time in seconds for one loop of the content. If the content is static, the duration is set to 0.
  @JsonKey(name: 'duration', defaultValue: 0)
  final double duration;

  /// Size of the file in bytes
  @JsonKey(name: 'size')
  final int size;

  double get aspectRatio => dims.first / dims.last;

  TenorMediaObject({
    required this.url,
    required this.dims,
    required this.duration,
    required this.size,
  });

  factory TenorMediaObject.fromJson(Map<String, dynamic> json) =>
      _$TenorMediaObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TenorMediaObjectToJson(this);

  factory TenorMediaObject.fromString(String message) =>
      TenorMediaObject.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());
}
