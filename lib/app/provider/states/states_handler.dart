import 'package:canary_app/app/provider/states/states.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../../domain/models/user.dart';

mixin StatesHandler {
  ProviderStates failureOrUserToState(Either<Failure, User> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (user) => UserState(
        user: user,
      ),
    );
  }
}
