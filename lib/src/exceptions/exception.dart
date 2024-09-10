class TenorException implements Exception {
  int code;
  String? message;

  TenorException({
    required this.code,
    this.message,
  });

  @override
  String toString() => "TenorException code: $code, message: $message";
}
