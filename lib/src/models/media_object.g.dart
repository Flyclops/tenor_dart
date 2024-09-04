// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorMediaObject _$TenorMediaObjectFromJson(Map<String, dynamic> json) =>
    TenorMediaObject(
      dims: (json['dims'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      size: (json['size'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$TenorMediaObjectToJson(TenorMediaObject instance) =>
    <String, dynamic>{
      'dims': instance.dims,
      'duration': instance.duration,
      'size': instance.size,
      'url': instance.url,
    };
