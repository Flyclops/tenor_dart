import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';

void main() {
  final testSearchTerm = 'dominoes';
  final testPath = '?apiKey=1234&country=US&locale=en_US';
  final testImage =
      'https://media1.tenor.com/m/VWnlUqZcVMsAAAAC/dominos-falling.gif';
  final testName = 'Dominos Falling GIF';

  group('TenorCategory >', () {
    test('.fromJson()', () {
      final json = {
        'image': testImage,
        'name': testName,
        'path': testPath,
        'search_term': testSearchTerm,
      };
      final category = TenorCategory.fromJson(json);
      expect(category.image, testImage);
      expect(category.name, testName);
      expect(category.path, testPath);
      expect(category.searchTerm, testSearchTerm);
    });

    test('.toJson()', () {
      final category = TenorCategory(
        image: testImage,
        name: testName,
        path: testPath,
        searchTerm: testSearchTerm,
      );
      final json = category.toJson();

      expect(json, {
        'image': testImage,
        'name': testName,
        'path': testPath,
        'search_term': testSearchTerm,
      });
    });
  });
}
