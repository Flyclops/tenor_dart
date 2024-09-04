import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable()
class TenorCategory {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  /// A URL to the media source for the category's example GIF
  @JsonKey(name: 'image', disallowNullValue: true)
  final String image;

  /// Category name to overlay over the image. The name is translated to match the locale of the corresponding request.
  @JsonKey(name: 'name', disallowNullValue: true)
  final String name;

  /// The search URL to request if the user selects the category.
  @JsonKey(name: 'path', disallowNullValue: true)
  final String path;

  /// The search term that corresponds to the category. The search term is translated to match the locale of the corresponding request.
  @JsonKey(name: 'searchterm', disallowNullValue: true)
  final String searchTerm;

  TenorCategory({
    required this.image,
    required this.name,
    required this.path,
    required this.searchTerm,
  });

  factory TenorCategory.fromJson(Map<String, dynamic> json) =>
      _$TenorCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TenorCategoryToJson(this);

  factory TenorCategory.fromString(String message) =>
      TenorCategory.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());
}
