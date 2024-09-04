/// Filter the [Response Objects](https://developers.google.com/tenor/guides/response-objects-and-errors#response-object) to only include GIFs with aspect ratios that fit within the selected range.
enum TenorAspectRatioRange {
  /// No constraints
  all,

  /// 0.42 <= aspect ratio <= 2.36
  wide,

  /// 0.56 <= aspect ratio <= 1.78
  standard,
}
