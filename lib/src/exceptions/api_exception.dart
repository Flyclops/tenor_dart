class TenorApiException implements Exception {
  int code;
  String? message;

  TenorApiException({
    required this.code,
    this.message,
  });

  @override
  String toString() => "TenorApiException code: $code, message: $message";
}
