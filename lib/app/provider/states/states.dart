import '../../../data/errors/failures.dart';

abstract class ProviderStates {
  const ProviderStates();
}

class DoneState extends ProviderStates {}

class ErrorState extends ProviderStates {
  final Failure failure;

  const ErrorState({required this.failure});
}

class DataState<T> extends ProviderStates {
  final T data;

  DataState({required this.data});
}
