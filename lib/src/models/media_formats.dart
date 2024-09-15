import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/constants/media_format.dart';
import 'package:tenor_dart/src/models/media_object.dart';

part 'media_formats.g.dart';

/// Based on [content formats](https://developers.google.com/tenor/guides/response-objects-and-errors#content-formats) from the Tenor API.
///
/// For mobile, use the nano- or tiny-sized files for previews and the tiny-sized files for shares.
@JsonSerializable(explicitToJson: true)
class TenorMediaFormats {
  static const _encoder = JsonEncoder.withIndent('  ');

  @JsonKey(name: TenorMediaFormat.gif)
  final TenorMediaObject? gif;

  @JsonKey(name: TenorMediaFormat.gifTransparent)
  final TenorMediaObject? gifTransparent;

  @JsonKey(name: TenorMediaFormat.loopedMp4)
  final TenorMediaObject? loopedMp4;

  @JsonKey(name: TenorMediaFormat.mediumGif)
  final TenorMediaObject? mediumGif;

  @JsonKey(name: TenorMediaFormat.mp4)
  final TenorMediaObject? mp4;

  @JsonKey(name: TenorMediaFormat.nanoGif)
  final TenorMediaObject? nanoGif;

  @JsonKey(name: TenorMediaFormat.nanoGifTransparent)
  final TenorMediaObject? nanoGifTransparent;

  @JsonKey(name: TenorMediaFormat.nanoMp4)
  final TenorMediaObject? nanoMp4;

  @JsonKey(name: TenorMediaFormat.nanoWebm)
  final TenorMediaObject? nanoWebm;

  @JsonKey(name: TenorMediaFormat.nanoWebpTransparent)
  final TenorMediaObject? nanoWebpTransparent;

  @JsonKey(name: TenorMediaFormat.preview)
  final TenorMediaObject? preview;

  @JsonKey(name: TenorMediaFormat.tinyGif)
  final TenorMediaObject? tinyGif;

  @JsonKey(name: TenorMediaFormat.tinyGifTransparent)
  final TenorMediaObject? tinyGifTransparent;

  @JsonKey(name: TenorMediaFormat.tinyMp4)
  final TenorMediaObject? tinyMp4;

  @JsonKey(name: TenorMediaFormat.tinyWebm)
  final TenorMediaObject? tinyWebm;

  @JsonKey(name: TenorMediaFormat.tinyWebpTransparent)
  final TenorMediaObject? tinyWebpTransparent;

  @JsonKey(name: TenorMediaFormat.webm)
  final TenorMediaObject? webm;

  @JsonKey(name: TenorMediaFormat.webpTransparent)
  final TenorMediaObject? webpTransparent;

  const TenorMediaFormats({
    this.gif,
    this.gifTransparent,
    this.loopedMp4,
    this.mediumGif,
    this.mp4,
    this.nanoGif,
    this.nanoGifTransparent,
    this.nanoMp4,
    this.nanoWebm,
    this.nanoWebpTransparent,
    this.preview,
    this.tinyGif,
    this.tinyGifTransparent,
    this.tinyMp4,
    this.tinyWebm,
    this.tinyWebpTransparent,
    this.webm,
    this.webpTransparent,
  });

  factory TenorMediaFormats.fromJson(Map<String, dynamic> json) =>
      _$TenorMediaFormatsFromJson(json);

  Map<String, dynamic> toJson() => _$TenorMediaFormatsToJson(this);

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
