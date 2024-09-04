import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/models/result.dart';
import 'package:tenor_dart/src/service/gif_fetcher.dart';

class TenorResponse extends Equatable {
  final List<TenorResult> results;
  final String? next;
  final TenorContentFilter contentFilter;
  final String? keys;
  final List<String>? mediaFilter;
  final TenorAspectRatioRange aspectRatioRange;
  final Endpoint? endpoint;

  const TenorResponse({
    required this.results,
    this.endpoint,
    this.keys,
    this.next,
    this.contentFilter = TenorContentFilter.off,
    this.mediaFilter = const [TenorMediaFormat.tinygif],
    this.aspectRatioRange = TenorAspectRatioRange.all,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toJson()).toList(),
      'next': next,
      'contentFilter': contentFilter.name,
      'mediaFilter': mediaFilter?.join(','),
      'aspectRatioRange': aspectRatioRange.name,
    };
  }

  static TenorResponse? fromMap(
    Map<String, dynamic>? map, {
    bool canShare = false,
    Endpoint? endPoint,
    String? keys,
  }) {
    if (map == null) return null;
    return TenorResponse(
      results: List<TenorResult>.from(
        map['results']?.map(
              (x) => TenorResult.fromJson(x),
            ) ??
            <TenorResult>[],
      ),
      next: map['next'],
      endpoint: endPoint,
      keys: keys,
      contentFilter: map['contentFilter'] ?? TenorContentFilter.off,
      mediaFilter: map['mediaFilter'],
      aspectRatioRange: map['aspectRatioRange'] ?? TenorAspectRatioRange.all,
    );
  }

  Future<TenorResponse?> fetchNext({int limit = 1}) {
    return privateRequestGif(
      endpoint!,
      keys!,
      limit: limit,
      contentFilter: contentFilter,
      aspectRatioRange: aspectRatioRange,
      mediaFilter: mediaFilter,
      pos: next,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TenorResponse(results: $results, next: $next)';

  static TenorResponse? fromJson(
    String source, {
    bool canShare = false,
    String? keys,
  }) =>
      TenorResponse.fromMap(
        json.decode(source),
        canShare: canShare,
        keys: keys,
      );

  @override
  List<Object?> get props => [results];
}
