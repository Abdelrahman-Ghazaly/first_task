class ServerException implements Exception {
  const ServerException({
    required this.errorMessage,
  });

  final String errorMessage;
}
