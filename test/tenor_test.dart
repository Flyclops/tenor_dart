import 'package:mocktail/mocktail.dart';
import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';

import 'mocks/mocks.dart';

void main() {
  group('Tenor >', () {
    final mockTenorHttpClient = MockTenorHttpClient();
    final tenorClient = Tenor(apiKey: '12345', client: mockTenorHttpClient);

    setUpAll(() {
      registerFallbackValue(TenorEndpoint.featured);
      registerFallbackValue(Duration.zero);
    });

    tearDown(() {
      reset(mockTenorHttpClient);
    });

    test('Make sure it is the right type', () {
      expect(tenorClient, isA<Tenor>());
    });

    test('.featured()', () async {
      when(
        () => mockTenorHttpClient.getGifs(
          any(),
          any(),
          any(),
          aspectRatioRange: any(named: 'aspectRatioRange'),
          contentFilter: any(named: 'contentFilter'),
          limit: any(named: 'limit'),
          mediaFilter: any(named: 'mediaFilter'),
          sticker: any(named: 'sticker'),
        ),
      ).thenAnswer((_) async {
        return TenorResponse(
          aspectRatioRange: TenorAspectRatioRange.standard,
          results: [],
        );
      });

      final test = await tenorClient.featured(
        aspectRatioRange: TenorAspectRatioRange.standard,
        limit: 5,
        mediaFilter: [TenorMediaFormat.mediumGif],
        sticker: true,
      );

      expect(test?.aspectRatioRange, TenorAspectRatioRange.standard);
    });
  });
}
