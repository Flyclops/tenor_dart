import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

void main() {
  final testAspectRatioRange = TenorAspectRatioRange.standard;
  final testContentFilter = TenorContentFilter.high;
  final testEndpoint = TenorEndpoint.categories;
  final testMediaFilter = [TenorMediaFormat.gif];
  final testNext = '123456';
  final testParameters = 'apiKey=1234&country=US&locale=en_US';
  final testResults = <TenorResult>[];
  final testDuration = const Duration(seconds: 10);

  setUpAll(() {
    registerFallbackValue(testEndpoint);
    registerFallbackValue(testDuration);
    registerFallbackValue(testParameters);
  });

  group('TenorResponse >', () {
    test('.fetchNext()', () {
      final mockHttpClient = MockTenorHttpClient();
      final response = TenorResponse(
        aspectRatioRange: testAspectRatioRange,
        contentFilter: testContentFilter,
        endpoint: testEndpoint,
        mediaFilter: testMediaFilter,
        next: testNext,
        parameters: testParameters,
        results: testResults,
        timeout: testDuration,
      );

      // stub getGifs
      when(
        () => mockHttpClient.getGifs(
          any(),
          any(),
          any(),
          aspectRatioRange: any(named: 'aspectRatioRange'),
          contentFilter: any(named: 'contentFilter'),
          limit: any(named: 'limit'),
          mediaFilter: any(named: 'mediaFilter'),
          pos: any(named: 'pos'),
        ),
      ).thenAnswer((_) async {
        return response;
      });

      // call fetchNext
      response.fetchNext(limit: 2, httpClient: mockHttpClient);

      // verify getGifs was called
      verify(
        () => (mockHttpClient.getGifs(
          any(),
          any(),
          any(),
          aspectRatioRange: any(named: 'aspectRatioRange'),
          contentFilter: any(named: 'contentFilter'),
          limit: any(named: 'limit'),
          mediaFilter: any(named: 'mediaFilter'),
          pos: any(named: 'pos'),
        )),
      ).called(1);
    });

    test('.fromJson()', () {
      final json = {
        'aspect_ratio_range': testAspectRatioRange.name,
        'content_filter': testContentFilter.name,
        'endpoint': testEndpoint.name,
        'media_filter': testMediaFilter,
        'next': testNext,
        'parameters': testParameters,
        'results': testResults,
        'timeout': testDuration.inMicroseconds,
      };
      final response = TenorResponse.fromJson(json);
      expect(response.aspectRatioRange, testAspectRatioRange);
      expect(response.contentFilter, testContentFilter);
      expect(response.endpoint, testEndpoint);
      expect(response.mediaFilter, testMediaFilter);
      expect(response.next, testNext);
      expect(response.parameters, testParameters);
      expect(response.results, testResults);
      expect(response.timeout, testDuration);
    });

    test('.toJson()', () {
      final category = TenorResponse(
        aspectRatioRange: testAspectRatioRange,
        contentFilter: testContentFilter,
        endpoint: testEndpoint,
        mediaFilter: testMediaFilter,
        next: testNext,
        parameters: testParameters,
        results: testResults,
        timeout: testDuration,
      );
      final json = category.toJson();

      expect(json, {
        'aspect_ratio_range': testAspectRatioRange.name,
        'content_filter': testContentFilter.name,
        'endpoint': testEndpoint.name,
        'media_filter': testMediaFilter,
        'next': testNext,
        'parameters': testParameters,
        'results': testResults,
        'timeout': testDuration.inMicroseconds,
      });
    });
  });
}
