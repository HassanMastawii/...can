import 'package:canary_app/domain/models/profile.dart';
import 'package:canary_app/domain/models/room.dart';

import '../../../data/errors/failures.dart';

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

class RoomsState extends ProviderStates {
  final List<Room> rooms;

  RoomsState({required this.rooms});
}

class RoomState extends ProviderStates {
  final Room room;

  RoomState({required this.room});
}

class ResState extends ProviderStates {
  final String path;

  ResState({required this.path});
}
