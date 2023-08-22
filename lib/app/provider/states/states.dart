import '../../../data/errors/failures.dart';
import '../../../domain/models/user.dart';

abstract class ProviderStates {
  const ProviderStates();
}

class InitialState extends ProviderStates {}

class LoadingState extends ProviderStates {}

class ErrorState extends ProviderStates {
  final Failure failure;

  const ErrorState({required this.failure});
}

class UserState extends ProviderStates {
  final User user;

  UserState({required this.user});
}
