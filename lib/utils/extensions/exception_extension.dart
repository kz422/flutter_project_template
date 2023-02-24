class AppException implements Exception {
  AppException([this.message, this.prefix, this.url]);

  final String? message;
  final String? prefix;
  final String? url;
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'BadRequest', url);
}
