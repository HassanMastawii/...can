import 'package:canary_app/app/provider/states/states.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../../domain/models/user.dart';

mixin StatesHandler {
  ProviderStates failureOrProfileToState(Either<Failure, Profile> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (profile) => ProfileState(
        profile: profile,
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
