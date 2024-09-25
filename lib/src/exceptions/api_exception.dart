class TenorApiException implements Exception {
  int code;
  String? message;

  TenorApiException({
    required this.code,
    this.message,
  });

  // coverage:ignore-start
  @override
  String toString() => "TenorApiException code: $code, message: $message";
  // coverage:ignore-end
}
