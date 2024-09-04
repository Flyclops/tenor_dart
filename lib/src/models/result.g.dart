// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorResult _$TenorResultFromJson(Map<String, dynamic> json) => TenorResult(
      created: (json['created'] as num).toDouble(),
      hasAudio: json['hasaudio'] as bool? ?? false,
      id: json['id'] as String,
      media: json['media_formats'] == null
          ? const TenorMediaFormats()
          : TenorMediaFormats.fromJson(
              json['media_formats'] as Map<String, dynamic>),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String,
      contentDescription: json['content_description'] as String,
      itemUrl: json['itemurl'] as String,
      hasCaption: json['hascaption'] as bool? ?? false,
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      bgColor: json['bg_color'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TenorResultToJson(TenorResult instance) =>
    <String, dynamic>{
      'created': instance.created,
      'hasaudio': instance.hasAudio,
      'id': instance.id,
      'media_formats': instance.media.toJson(),
      'tags': instance.tags,
      'title': instance.title,
      'content_description': instance.contentDescription,
      'itemurl': instance.itemUrl,
      'hascaption': instance.hasCaption,
      'flags': instance.flags,
      'bg_color': instance.bgColor,
      'url': instance.url,
    };
