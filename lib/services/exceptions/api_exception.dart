class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final String? details;

  ApiException({
    this.statusCode,
    required this.message,
    this.details,
  });

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message, details: $details)';
}
