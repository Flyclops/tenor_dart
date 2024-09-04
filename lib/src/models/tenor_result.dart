import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tenor_dart/src/models/media_formats.dart';

class TenorResult extends Equatable {
  final bool hasCaption;
  final bool hasaudio;
  final bool canShare;
  final int shares;
  final String? id;
  final String? keys;
  final String? title;
  final String? created;
  final String? url;
  final String? itemurl;
  final TenorMediaFormats? media;

  const TenorResult({
    this.canShare = false,
    this.created,
    this.hasaudio = false,
    this.hasCaption = false,
    this.id,
    this.keys,
    this.itemurl,
    this.media,
    this.shares = 0,
    this.title,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'canShare': canShare,
      'created': created,
      'hasaudio': hasaudio,
      'hasCaption': hasCaption,
      'id': id,
      'itemurl': itemurl,
      'media': media?.toJson(),
      'shares': shares,
      'title': title,
      'url': url,
    };
  }

  static TenorResult? fromMap(
    Map<String, dynamic>? map, {
    bool canShare = false,
    String? keys,
  }) {
    if (map == null) return null;
    return TenorResult(
      hasCaption: map['hascaption'] ?? false,
      hasaudio: map['hasaudio'] ?? false,
      shares: map['shares'] ?? 0,
      id: map['id'],
      keys: keys,
      title: map['title'],
      created: '${map['created']}',
      url: map['url'],
      itemurl: map['itemurl'],
      canShare: canShare,
      media: TenorMediaFormats.fromJson(
        (map['media_formats'] != null)
            ? map['media_formats']
            : <String, dynamic>{},
      ),
    );
  }

  String toJson() => json.encode(toMap());

  static TenorResult? fromJson(
    String source, {
    bool canShare = false,
    String? keys,
  }) =>
      TenorResult.fromMap(json.decode(source), canShare: canShare, keys: keys);

  @override
  String toString() {
    return 'TenorResult(hasCaption: $hasCaption, hasaudio: $hasaudio, shares: $shares, id: $id, title: $title, created: $created, url: $url, itemurl: $itemurl, media: $media)';
  }

  @override
  List<Object?> get props =>
      [hasCaption, hasaudio, shares, id, title, created, url, itemurl, media];
}
