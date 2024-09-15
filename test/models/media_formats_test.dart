import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';

void main() {
  final testPreview = {
    'url': 'url/to/preview',
    'dims': [10, 20],
    'duration': 1,
    'size': 1,
  };

  final testGif = {
    'url': 'url/to/gif',
    'dims': [20, 30],
    'duration': 2,
    'size': 2,
  };

  final testMediumGif = {
    'url': 'url/to/mediumgif',
    'dims': [30, 40],
    'duration': 3,
    'size': 3,
  };

  final testTinyGif = {
    'url': 'url/to/tinygif',
    'dims': [40, 50],
    'duration': 4,
    'size': 4,
  };

  final testNanoGif = {
    'url': 'url/to/nanogif',
    'dims': [50, 60],
    'duration': 5,
    'size': 5,
  };

  final testMp4 = {
    'url': 'url/to/mp4',
    'dims': [60, 70],
    'duration': 6,
    'size': 6,
  };

  final testLoopedMp4 = {
    'url': 'url/to/loopedmp4',
    'dims': [70, 80],
    'duration': 7,
    'size': 7,
  };

  final testTinyMp4 = {
    'url': 'url/to/tinymp4',
    'dims': [80, 90],
    'duration': 8,
    'size': 8,
  };

  final testNanoMp4 = {
    'url': 'url/to/nanomp4',
    'dims': [90, 100],
    'duration': 9,
    'size': 9,
  };

  final testWebm = {
    'url': 'url/to/webm',
    'dims': [100, 110],
    'duration': 10,
    'size': 10,
  };

  final testTinyWebm = {
    'url': 'url/to/tinyWebm',
    'dims': [110, 120],
    'duration': 11,
    'size': 11,
  };

  final testNanoWebm = {
    'url': 'url/to/nanoWebm',
    'dims': [120, 130],
    'duration': 12,
    'size': 12,
  };

  final testWebpTransparent = {
    'url': 'url/to/testWebpTransparent',
    'dims': [130, 140],
    'duration': 13,
    'size': 13,
  };

  final testTinyWebpTransparent = {
    'url': 'url/to/tinyWebpTransparent',
    'dims': [140, 150],
    'duration': 14,
    'size': 14,
  };

  final testNanoWebpTransparent = {
    'url': 'url/to/nanoWebpTransparent',
    'dims': [150, 160],
    'duration': 15,
    'size': 15,
  };

  final testGifTransparent = {
    'url': 'url/to/gifTransparent',
    'dims': [160, 170],
    'duration': 16,
    'size': 16,
  };

  final testTinyGifTransparent = {
    'url': 'url/to/tinyGifTransparent',
    'dims': [170, 180],
    'duration': 17,
    'size': 17,
  };

  final testNanoGifTransparent = {
    'url': 'url/to/nanoGifTransparent',
    'dims': [180, 190],
    'duration': 18,
    'size': 18,
  };

  group('MediaFormats >', () {
    test('.fromJson()', () {
      final json = {
        TenorMediaFormat.gif: testGif,
        TenorMediaFormat.gifTransparent: testGifTransparent,
        TenorMediaFormat.loopedMp4: testLoopedMp4,
        TenorMediaFormat.mediumGif: testMediumGif,
        TenorMediaFormat.mp4: testMp4,
        TenorMediaFormat.nanoGif: testNanoGif,
        TenorMediaFormat.nanoGifTransparent: testNanoGifTransparent,
        TenorMediaFormat.nanoMp4: testNanoMp4,
        TenorMediaFormat.nanoWebm: testNanoWebm,
        TenorMediaFormat.nanoWebpTransparent: testNanoWebpTransparent,
        TenorMediaFormat.preview: testPreview,
        TenorMediaFormat.tinyGif: testTinyGif,
        TenorMediaFormat.tinyGifTransparent: testTinyGifTransparent,
        TenorMediaFormat.tinyMp4: testTinyMp4,
        TenorMediaFormat.tinyWebm: testTinyWebm,
        TenorMediaFormat.tinyWebpTransparent: testTinyWebpTransparent,
        TenorMediaFormat.webm: testWebm,
        TenorMediaFormat.webpTransparent: testWebpTransparent,
      };

      final mediaFormats = TenorMediaFormats.fromJson(json);
      expect(mediaFormats.gif?.toJson(), testGif);
      expect(mediaFormats.gifTransparent?.toJson(), testGifTransparent);
      expect(mediaFormats.loopedMp4?.toJson(), testLoopedMp4);
      expect(mediaFormats.mediumGif?.toJson(), testMediumGif);
      expect(mediaFormats.mp4?.toJson(), testMp4);
      expect(mediaFormats.nanoGif?.toJson(), testNanoGif);
      expect(mediaFormats.nanoGifTransparent?.toJson(), testNanoGifTransparent);
      expect(mediaFormats.nanoMp4?.toJson(), testNanoMp4);
      expect(mediaFormats.nanoWebm?.toJson(), testNanoWebm);
      expect(
        mediaFormats.nanoWebpTransparent?.toJson(),
        testNanoWebpTransparent,
      );
      expect(mediaFormats.preview?.toJson(), testPreview);
      expect(mediaFormats.tinyGif?.toJson(), testTinyGif);
      expect(mediaFormats.tinyGifTransparent?.toJson(), testTinyGifTransparent);
      expect(mediaFormats.tinyMp4?.toJson(), testTinyMp4);
      expect(mediaFormats.tinyWebm?.toJson(), testTinyWebm);
      expect(
        mediaFormats.tinyWebpTransparent?.toJson(),
        testTinyWebpTransparent,
      );
      expect(mediaFormats.webm?.toJson(), testWebm);
      expect(mediaFormats.webpTransparent?.toJson(), testWebpTransparent);
    });

    test('.toJson()', () {
      final mediaFormats = TenorMediaFormats(
        gif: TenorMediaObject.fromJson(testGif),
        gifTransparent: TenorMediaObject.fromJson(testGifTransparent),
        loopedMp4: TenorMediaObject.fromJson(testLoopedMp4),
        mediumGif: TenorMediaObject.fromJson(testMediumGif),
        mp4: TenorMediaObject.fromJson(testMp4),
        nanoGif: TenorMediaObject.fromJson(testNanoGif),
        nanoGifTransparent: TenorMediaObject.fromJson(testNanoGifTransparent),
        nanoMp4: TenorMediaObject.fromJson(testNanoMp4),
        nanoWebm: TenorMediaObject.fromJson(testNanoWebm),
        nanoWebpTransparent: TenorMediaObject.fromJson(testNanoWebpTransparent),
        preview: TenorMediaObject.fromJson(testPreview),
        tinyGif: TenorMediaObject.fromJson(testTinyGif),
        tinyGifTransparent: TenorMediaObject.fromJson(testTinyGifTransparent),
        tinyMp4: TenorMediaObject.fromJson(testTinyMp4),
        tinyWebm: TenorMediaObject.fromJson(testTinyWebm),
        tinyWebpTransparent: TenorMediaObject.fromJson(testTinyWebpTransparent),
        webm: TenorMediaObject.fromJson(testWebm),
        webpTransparent: TenorMediaObject.fromJson(testWebpTransparent),
      );
      final json = mediaFormats.toJson();
      expect(json, {
        TenorMediaFormat.gif: testGif,
        TenorMediaFormat.gifTransparent: testGifTransparent,
        TenorMediaFormat.loopedMp4: testLoopedMp4,
        TenorMediaFormat.mediumGif: testMediumGif,
        TenorMediaFormat.mp4: testMp4,
        TenorMediaFormat.nanoGif: testNanoGif,
        TenorMediaFormat.nanoGifTransparent: testNanoGifTransparent,
        TenorMediaFormat.nanoMp4: testNanoMp4,
        TenorMediaFormat.nanoWebm: testNanoWebm,
        TenorMediaFormat.nanoWebpTransparent: testNanoWebpTransparent,
        TenorMediaFormat.preview: testPreview,
        TenorMediaFormat.tinyGif: testTinyGif,
        TenorMediaFormat.tinyGifTransparent: testTinyGifTransparent,
        TenorMediaFormat.tinyMp4: testTinyMp4,
        TenorMediaFormat.tinyWebm: testTinyWebm,
        TenorMediaFormat.tinyWebpTransparent: testTinyWebpTransparent,
        TenorMediaFormat.webm: testWebm,
        TenorMediaFormat.webpTransparent: testWebpTransparent,
      });
    });
  });
}
