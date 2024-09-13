// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'media_formats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorMediaFormats _$TenorMediaFormatsFromJson(Map<String, dynamic> json) =>
    TenorMediaFormats(
      preview: json['preview'] == null
          ? null
          : TenorMediaObject.fromJson(json['preview'] as Map<String, dynamic>),
      gif: json['gif'] == null
          ? null
          : TenorMediaObject.fromJson(json['gif'] as Map<String, dynamic>),
      mediumgif: json['mediumgif'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['mediumgif'] as Map<String, dynamic>),
      tinygif: json['tinygif'] == null
          ? null
          : TenorMediaObject.fromJson(json['tinygif'] as Map<String, dynamic>),
      nanogif: json['nanogif'] == null
          ? null
          : TenorMediaObject.fromJson(json['nanogif'] as Map<String, dynamic>),
      mp4: json['mp4'] == null
          ? null
          : TenorMediaObject.fromJson(json['mp4'] as Map<String, dynamic>),
      loopedmp4: json['loopedmp4'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['loopedmp4'] as Map<String, dynamic>),
      tinymp4: json['tinymp4'] == null
          ? null
          : TenorMediaObject.fromJson(json['tinymp4'] as Map<String, dynamic>),
      nanomp4: json['nanomp4'] == null
          ? null
          : TenorMediaObject.fromJson(json['nanomp4'] as Map<String, dynamic>),
      webm: json['webm'] == null
          ? null
          : TenorMediaObject.fromJson(json['webm'] as Map<String, dynamic>),
      tinywebm: json['tinywebm'] == null
          ? null
          : TenorMediaObject.fromJson(json['tinywebm'] as Map<String, dynamic>),
      nanowebm: json['nanowebm'] == null
          ? null
          : TenorMediaObject.fromJson(json['nanowebm'] as Map<String, dynamic>),
      webpTransparent: json['webp_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['webp_transparent'] as Map<String, dynamic>),
      tinywebpTransparent: json['tinywebp_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['tinywebp_transparent'] as Map<String, dynamic>),
      nanowebpTransparent: json['nanowebp_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['nanowebp_transparent'] as Map<String, dynamic>),
      gifTransparent: json['gif_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['gif_transparent'] as Map<String, dynamic>),
      tinygifTransparent: json['tinygif_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['tinygif_transparent'] as Map<String, dynamic>),
      nanogifTransparent: json['nanogif_transparent'] == null
          ? null
          : TenorMediaObject.fromJson(
              json['nanogif_transparent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TenorMediaFormatsToJson(TenorMediaFormats instance) =>
    <String, dynamic>{
      'preview': instance.preview?.toJson(),
      'gif': instance.gif?.toJson(),
      'mediumgif': instance.mediumgif?.toJson(),
      'tinygif': instance.tinygif?.toJson(),
      'nanogif': instance.nanogif?.toJson(),
      'mp4': instance.mp4?.toJson(),
      'loopedmp4': instance.loopedmp4?.toJson(),
      'tinymp4': instance.tinymp4?.toJson(),
      'nanomp4': instance.nanomp4?.toJson(),
      'webm': instance.webm?.toJson(),
      'tinywebm': instance.tinywebm?.toJson(),
      'nanowebm': instance.nanowebm?.toJson(),
      'webp_transparent': instance.webpTransparent?.toJson(),
      'tinywebp_transparent': instance.tinywebpTransparent?.toJson(),
      'nanowebp_transparent': instance.nanowebpTransparent?.toJson(),
      'gif_transparent': instance.gifTransparent?.toJson(),
      'tinygif_transparent': instance.tinygifTransparent?.toJson(),
      'nanogif_transparent': instance.nanogifTransparent?.toJson(),
    };
