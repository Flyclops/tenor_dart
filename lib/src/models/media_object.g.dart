// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorMediaObject _$TenorMediaObjectFromJson(Map<String, dynamic> json) =>
    TenorMediaObject(
      url: json['url'] as String,
      dims: (json['dims'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$TenorMediaObjectToJson(TenorMediaObject instance) =>
    <String, dynamic>{
      'url': instance.url,
      'dims': instance.dims,
      'duration': instance.duration,
      'size': instance.size,
    };
