import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = ""});
}

class OfflineFailure extends Failure {
  const OfflineFailure({super.message = "لا يوجد إنترنت"});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = "ServerFailure"});

  @override
  List<Object?> get props => [];
}

class NotLogedInFailure extends Failure {
  const NotLogedInFailure({super.message = "NotLogedInFailure"});

  @override
  List<Object?> get props => [];
}

class UnKnownFailure extends Failure {
  const UnKnownFailure({super.message = "UnKnownFailure"});
  @override
  List<Object?> get props => [];
}
