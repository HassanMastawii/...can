abstract class ProviderStates {
  const ProviderStates();
}

class InitialState extends ProviderStates {}

class LoadingState extends ProviderStates {}

class ErrorState extends ProviderStates {}
