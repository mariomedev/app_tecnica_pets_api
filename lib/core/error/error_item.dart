class ErrorItem implements Exception {
  final String? code;
  final String message;

  ErrorItem({this.code, required this.message});

  @override
  String toString() => 'ErrorItem(code: $code, message: $message)';
}
