import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/constants/media_format.dart';
import 'package:tenor_dart/src/models/media_object.dart';

part 'media_formats.g.dart';

/// Based on [media response object](https://developers.google.com/tenor/guides/response-objects-and-errors#media-object) from the Tenor API.
///
/// For mobile, use the nano- or tiny-sized files for previews and the tiny-sized files for shares.
@JsonSerializable(explicitToJson: true)
class TenorMediaFormats {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  @JsonKey(name: TenorMediaFormat.preview)
  final TenorMediaObject? preview;

  @JsonKey(name: TenorMediaFormat.gif)
  final TenorMediaObject? gif;

  @JsonKey(name: TenorMediaFormat.mediumgif)
  final TenorMediaObject? mediumgif;

  @JsonKey(name: TenorMediaFormat.tinygif)
  final TenorMediaObject? tinygif;

  @JsonKey(name: TenorMediaFormat.nanogif)
  final TenorMediaObject? nanogif;

  @JsonKey(name: TenorMediaFormat.mp4)
  final TenorMediaObject? mp4;

  @JsonKey(name: TenorMediaFormat.loopedmp4)
  final TenorMediaObject? loopedmp4;

  @JsonKey(name: TenorMediaFormat.tinymp4)
  final TenorMediaObject? tinymp4;

  @JsonKey(name: TenorMediaFormat.nanomp4)
  final TenorMediaObject? nanomp4;

  @JsonKey(name: TenorMediaFormat.webm)
  final TenorMediaObject? webm;

  @JsonKey(name: TenorMediaFormat.tinywebm)
  final TenorMediaObject? tinywebm;

  @JsonKey(name: TenorMediaFormat.nanowebm)
  final TenorMediaObject? nanowebm;

  @JsonKey(name: TenorMediaFormat.webpTransparent)
  final TenorMediaObject? webpTransparent;

  @JsonKey(name: TenorMediaFormat.tinywebpTransparent)
  final TenorMediaObject? tinywebpTransparent;

  @JsonKey(name: TenorMediaFormat.nanowebpTransparent)
  final TenorMediaObject? nanowebpTransparent;

  @JsonKey(name: TenorMediaFormat.gifTransparent)
  final TenorMediaObject? gifTransparent;

  @JsonKey(name: TenorMediaFormat.tinygifTransparent)
  final TenorMediaObject? tinygifTransparent;

  @JsonKey(name: TenorMediaFormat.nanogifTransparent)
  final TenorMediaObject? nanogifTransparent;

  TenorMediaFormats({
    this.preview,
    this.gif,
    this.mediumgif,
    this.tinygif,
    this.nanogif,
    this.mp4,
    this.loopedmp4,
    this.tinymp4,
    this.nanomp4,
    this.webm,
    this.tinywebm,
    this.nanowebm,
    this.webpTransparent,
    this.tinywebpTransparent,
    this.nanowebpTransparent,
    this.gifTransparent,
    this.tinygifTransparent,
    this.nanogifTransparent,
  });

  factory TenorMediaFormats.fromJson(Map<String, dynamic> json) =>
      _$TenorMediaFormatsFromJson(json);

  Map<String, dynamic> toJson() => _$TenorMediaFormatsToJson(this);

  factory TenorMediaFormats.fromString(String message) =>
      TenorMediaFormats.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());
}
