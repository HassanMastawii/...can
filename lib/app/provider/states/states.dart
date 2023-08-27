import '../../../data/errors/failures.dart';
import '../../../domain/models/user.dart';

abstract class ProviderStates {
  const ProviderStates();
}

class InitialState extends ProviderStates {}

class LoadingState extends ProviderStates {}

class DoneState extends ProviderStates {}

class ErrorState extends ProviderStates {
  final Failure failure;

  const ErrorState({required this.failure});
}

class ProfileState extends ProviderStates {
  final Profile profile;

  ProfileState({required this.profile});
}
