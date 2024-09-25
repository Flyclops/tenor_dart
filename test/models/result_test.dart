import 'package:tenor_dart/tenor_dart.dart';
import 'package:test/test.dart';

void main() {
  final testBgColor = '#FFFFFF';
  final testContentDescription = 'A GIF of dominos falling';
  final testCreated = 1633072800.0;
  final testFlags = ['sticker', 'static'];
  final testHasAudio = true;
  final testHasCaption = true;
  final testId = '12345';
  final testItemUrl = 'https://tenor.com/view/dominos-falling-gif-12345';
  final testMedia = TenorMediaFormats();
  final testTags = ['funny', 'meme'];
  final testTitle = 'Dominos Falling GIF';
  final testUrl = 'https://tenor.com/view/dominos-falling-gif-12345';

  group('TenorResult >', () {
    test('.fromJson()', () {
      final json = {
        'bg_color': testBgColor,
        'content_description': testContentDescription,
        'created': testCreated,
        'flags': testFlags,
        'hasaudio': testHasAudio,
        'hascaption': testHasCaption,
        'id': testId,
        'itemurl': testItemUrl,
        'media_formats': testMedia.toJson(),
        'tags': testTags,
        'title': testTitle,
        'url': testUrl,
      };
      final result = TenorResult.fromJson(json);
      expect(result.bgColor, testBgColor);
      expect(result.contentDescription, testContentDescription);
      expect(result.created, testCreated);
      expect(result.flags, testFlags);
      expect(result.hasAudio, testHasAudio);
      expect(result.hasCaption, testHasCaption);
      expect(result.id, testId);
      expect(result.itemUrl, testItemUrl);
      expect(result.media.toJson(), testMedia.toJson());
      expect(result.tags, testTags);
      expect(result.title, testTitle);
      expect(result.url, testUrl);
    });

    test('.toJson()', () {
      final result = TenorResult(
        bgColor: testBgColor,
        contentDescription: testContentDescription,
        created: testCreated,
        flags: testFlags,
        hasAudio: testHasAudio,
        hasCaption: testHasCaption,
        id: testId,
        itemUrl: testItemUrl,
        media: testMedia,
        tags: testTags,
        title: testTitle,
        url: testUrl,
      );
      final json = result.toJson();

      expect(json, {
        'bg_color': testBgColor,
        'content_description': testContentDescription,
        'created': testCreated,
        'flags': testFlags,
        'hasaudio': testHasAudio,
        'hascaption': testHasCaption,
        'id': testId,
        'itemurl': testItemUrl,
        'media_formats': testMedia.toJson(),
        'tags': testTags,
        'title': testTitle,
        'url': testUrl,
      });
    });
  });
}
