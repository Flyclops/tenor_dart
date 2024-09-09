import 'package:tenor_dart/src/models/media_object_dimensions.dart';
import 'package:test/test.dart';

void main() {
  group('TenorMediaObjectDimensions >', () {
    test('Height, width and aspect ratio should be correct', () {
      final dimensions = TenorMediaObjectDimensions([220, 400]);

      expect(dimensions.width, 220);
      expect(dimensions.height, 400);
      expect(dimensions.aspectRatio, 220 / 400);
    });
    test('Should error out if dimensions are not 2 in length', () {
      expect(
        () => TenorMediaObjectDimensions([]),
        throwsA(isA<ArgumentError>()),
      );
    });
    test('.fromJson()', () {
      final json = {
        'dims': [150, 300],
      };
      final dimensions = TenorMediaObjectDimensions.fromJson(json);
      print(dimensions.toString());
      expect(dimensions.width, 150);
      expect(dimensions.height, 300);
      expect(dimensions.aspectRatio, 150 / 300);
    });
  });
  test('.toJson()', () {
    final dimensions = TenorMediaObjectDimensions([300, 600]);
    final json = dimensions.toJson();

    expect(json, {
      'dims': [300, 600],
    });
  });
}
