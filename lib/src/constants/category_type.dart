/// Determines the type of categories returned.
///
/// https://developers.google.com/tenor/guides/endpoints#categories
enum TenorCategoryType {
  /// The current featured emotional or reaction-based GIF categories. This includes a preview GIF for each term.
  featured,

  /// The current trending search terms. This includes a preview GIF for each term.
  trending,
}
