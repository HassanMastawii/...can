import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/usecases/room/create_room_usecase.dart';
import 'package:canary_app/domain/usecases/room/room_info_usecase.dart';
import 'package:canary_app/domain/usecases/room/search_room_usecase.dart';
import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier with StatesHandler {
  final SearchRoomUsecase _searchRoomUsecase;
  final RoomInfoUsecase _roomInfoUsecase;
  final CreateRoomUsecase _createRoomUsecase;
  RoomProvider(
    this._searchRoomUsecase,
    this._roomInfoUsecase,
    this._createRoomUsecase,
  );
  bool isLoading = false;

  Future<ProviderStates> searchRoom(String search) async {
    isLoading = true;
    notifyListeners();
    final failureOrRooms = await _searchRoomUsecase(search);
    isLoading = false;
    notifyListeners();
    return failureOrRoomsToState(failureOrRooms);
  }

  Future<ProviderStates> getRoomInfoRoom(int id) async {
    isLoading = true;
    notifyListeners();
    final failureOrRoom = await _roomInfoUsecase(id);
    isLoading = false;
    notifyListeners();
    return failureOrRoomToState(failureOrRoom);
  }

  Future<ProviderStates> createRoom(Room room) async {
    isLoading = true;
    notifyListeners();
    final failureOrDone = await _createRoomUsecase(room);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrDone);
  }
}
