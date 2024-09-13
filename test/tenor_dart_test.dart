import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';

void main() {
  // this is so we can get an accurate coverage report
  group('Tenor >', () {
    final tenorClient = Tenor(apiKey: '12345');

    test('Make sure it is the same type', () {
      expect(tenorClient, isA<Tenor>());
    });
  });
}
