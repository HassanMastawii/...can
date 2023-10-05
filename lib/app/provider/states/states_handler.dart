import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/domain/models/profile.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

mixin StatesHandler {
  ProviderStates failureOrProfileToState(Either<Failure, Profile> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (profile) => ProfileState(
        profile: profile,
      ),
    );
  }

  ProviderStates failureOrListToState<T>(Either<Failure, List<T>> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (list) => ListState<T>(
        list: list,
      ),
    );
  }

  ProviderStates failureOrResToState(Either<Failure, String> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (path) => ResState(
        path: path,
      ),
    );
  }

  ProviderStates failureOrRoomToState(Either<Failure, Room> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (room) => RoomState(
        room: room,
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
