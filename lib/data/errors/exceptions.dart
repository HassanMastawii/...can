class ServerException implements Exception {
  final String message;

  ServerException({this.message = "ServerException"});
}

class OfflineException implements Exception {}

class NotLogedInException implements Exception {
  final String message;

  NotLogedInException({this.message = "NotLogedInException"});
}

class RegisterException implements Exception {
  final String message;
  final String? name;
  final String? email;
  final String? password;

  RegisterException({
    this.message = "RegisterException",
    this.name,
    this.email,
    this.password,
  });
}

class UnKnownException implements Exception {}
