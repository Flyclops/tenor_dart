import 'package:json_annotation/json_annotation.dart';

part 'media_object_dimensions.g.dart';

@JsonSerializable(explicitToJson: true)
class TenorMediaObjectDimensions {
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
        '_dimensions',
        'It must be a list with a length of 2',
      );
    }

    width = _dimensions.first.toDouble();
    height = _dimensions.last.toDouble();
    aspectRatio = width / height;
  }

  factory TenorMediaObjectDimensions.fromJson(Map<String, dynamic> json) =>
      _$TenorMediaObjectDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$TenorMediaObjectDimensionsToJson(this);

  // coverage:ignore-start
  @override
  String toString() =>
      'TenorMediaObjectDimensions(width: $width, height: $height, aspectRatio: $aspectRatio)';
  // coverage:ignore-end
}
