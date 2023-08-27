class ServerException implements Exception {
  final String message;

  ServerException({this.message = "ServerException"});
}

class OfflineException implements Exception {}

class NotLogedInException implements Exception {
  final String message;

  NotLogedInException({this.message = "NotLogedInException"});
}

class UnKnownException implements Exception {}
