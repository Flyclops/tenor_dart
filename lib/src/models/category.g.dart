// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorCategory _$TenorCategoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['search_term', 'path', 'image', 'name'],
  );
  return TenorCategory(
    searchTerm: json['search_term'] as String,
    path: json['path'] as String,
    image: json['image'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TenorCategoryToJson(TenorCategory instance) =>
    <String, dynamic>{
      'search_term': instance.searchTerm,
      'path': instance.path,
      'image': instance.image,
      'name': instance.name,
    };
