import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/domain/models/backgrounds.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/usecases/room/create_room_usecase.dart';
import 'package:canary_app/domain/usecases/room/get_backgrounds_usecase.dart';
import 'package:canary_app/domain/usecases/room/room_info_usecase.dart';
import 'package:canary_app/domain/usecases/room/search_room_usecase.dart';
import 'package:canary_app/domain/usecases/room/set_background_img_usecase.dart';
import 'package:canary_app/domain/usecases/room/set_room_password_usecase.dart';
import 'package:canary_app/domain/usecases/room/up_room_img_usecase.dart';
import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier with StatesHandler {
  final SearchRoomUsecase _searchRoomUsecase;
  final RoomInfoUsecase _roomInfoUsecase;
  final CreateRoomUsecase _createRoomUsecase;
  final UpRoomImgUsecase _upRoomImgUsecase;
  final SetBackgroundImgUsecase _setBackgroundImgUsecase;
  final GetBackgroundsUsecase _getBackgroundsUsecase;
  final SetRoomPasswordUsecase _setRoomPasswordUsecase;

  RoomProvider(
    this._searchRoomUsecase,
    this._roomInfoUsecase,
    this._createRoomUsecase,
    this._upRoomImgUsecase,
    this._setBackgroundImgUsecase,
    this._getBackgroundsUsecase,
    this._setRoomPasswordUsecase,
  );
  bool isLoading = false;

  Future<ProviderStates> searchRoom(String search) async {
    isLoading = true;
    notifyListeners();
    final failureOrRooms = await _searchRoomUsecase(search);
    isLoading = false;
    notifyListeners();
    return failureOrListToState<Room>(failureOrRooms);
  }

  Future<ProviderStates> getBackgrounds() async {
    isLoading = true;
    notifyListeners();
    final failureOrList = await _getBackgroundsUsecase();
    isLoading = false;
    notifyListeners();
    return failureOrListToState<Background>(failureOrList);
  }

  Future<ProviderStates> upRoomImg(String path, int roomid) async {
    isLoading = true;
    notifyListeners();
    final failureOrRes = await _upRoomImgUsecase(path, roomid);
    isLoading = false;
    notifyListeners();
    return failureOrResToState(failureOrRes);
  }

  Future<ProviderStates> setbackgroundImg(String path, int roomid) async {
    isLoading = true;
    notifyListeners();
    final failureOrdone = await _setBackgroundImgUsecase(path, roomid);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrdone);
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

  Future<ProviderStates> setRoomPassword(String password, int roomId) async {
    isLoading = true;
    notifyListeners();
    final failureOrRes = await _setRoomPasswordUsecase(password, roomId);
    isLoading = false;
    notifyListeners();
    return failureOrResToState(failureOrRes);
  }
}
