import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'media_object_dimensions.g.dart';

@JsonSerializable()
class TenorMediaObjectDimensions {
  static const _encoder = JsonEncoder.withIndent('  ');
  static const _decoder = JsonDecoder();

  @JsonKey(
    name: 'dims',
    required: true,
    includeFromJson: true,
    includeIfNull: false,
    includeToJson: true,
  )
  final List<int> _dimensions;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double width;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double height;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double aspectRatio;

  TenorMediaObjectDimensions(this._dimensions) {
    if (_dimensions.length != 2) {
      throw ArgumentError.value(
        _dimensions,
        'dimensions',
        'Dimensions must have exactly two values: width and height',
      );
    }

    width = _dimensions.first.toDouble();
    height = _dimensions.last.toDouble();
    aspectRatio = width / height;
  }

  factory TenorMediaObjectDimensions.fromJson(Map<String, dynamic> json) =>
      _$TenorMediaObjectDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$TenorMediaObjectDimensionsToJson(this);

  factory TenorMediaObjectDimensions.fromString(String message) =>
      TenorMediaObjectDimensions.fromJson(_decoder.convert(message));

  @override
  String toString() => _encoder.convert(toJson());
}
