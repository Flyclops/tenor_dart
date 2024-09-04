/// Filters are [designed](https://developers.google.com/tenor/guides/content-filtering) to map to the Motion Picture Association (MPA).
enum TenorContentFilter {
  /// MPA Rating: G
  high,

  /// MPA Ratings: G, PG
  medium,

  /// MPA Ratings: G, PG, PG-13
  low,

  /// MPA Ratings: G, PG, PG-13, R (no nudity)
  off,
}
