// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorCategory _$TenorCategoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['image', 'name', 'path', 'searchterm'],
  );
  return TenorCategory(
    image: json['image'] as String,
    name: json['name'] as String,
    path: json['path'] as String,
    searchTerm: json['searchterm'] as String,
  );
}

Map<String, dynamic> _$TenorCategoryToJson(TenorCategory instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'path': instance.path,
      'searchterm': instance.searchTerm,
    };
