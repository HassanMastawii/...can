import 'package:canary_app/app/provider/states/states.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

mixin StatesHandler {
  ProviderStates failureOrDataToState<T>(Either<Failure, T> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (data) => DataState<T>(
        data: data,
      ),
    );
  }

  ProviderStates failureOrDoneToState(Either<Failure, Unit> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (_) => DoneState(),
    );
  }
}
