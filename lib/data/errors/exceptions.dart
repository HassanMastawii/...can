class ServerException implements Exception {
  final String message;

  ServerException({this.message = "ServerException"});
}

class OfflineException implements Exception {}

class WrongAuthException implements Exception {
  final String message;

  WrongAuthException({this.message = "WrongAuthFailure"});
}

class UnKnownException implements Exception {}
