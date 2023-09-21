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

  ProviderStates failureOrRoomsToState(Either<Failure, List<Room>> either) {
    return either.fold(
      (failure) => ErrorState(failure: failure),
      (rooms) => RoomsState(
        rooms: rooms,
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
