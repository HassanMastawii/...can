import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/data/repositories/room_repo_impl.dart';
import 'package:canary_app/domain/models/backgrounds.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier with StatesHandler {
  // كلاس لادارة عمليات الخاصة بالرووم
  final RoomRepository _roomRepository;

  RoomProvider(
    this._roomRepository,
  );
  bool isLoading = false;
  bool isLoadingRoomInfo = false;
  bool isChangingImg = false;

  List<Message> messages = [];
  Room? myRoom;

  addMessage(Message message) {
    messages.insert(0, message);
    notifyListeners();
  }

  Future<ProviderStates> searchRoom(String search) async {
    isLoading = true;
    notifyListeners();
    final failureOrRooms = await _roomRepository.searchRoom(search);
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<List<Room>>(failureOrRooms);
  }

  Future<ProviderStates> getBackgrounds() async {
    isLoading = true;
    notifyListeners();
    final failureOrList = await _roomRepository.getBackgrounds();
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<List<Background>>(failureOrList);
  }

  Future<ProviderStates> getUserList(int roomid) async {
    isLoading = true;
    notifyListeners();
    final failureOrList = await _roomRepository.getUserList(roomid);
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<List<UserCoin>>(failureOrList);
  }

  Future<ProviderStates> getGiftsList() async {
    isLoading = true;
    notifyListeners();
    final failureOrList = await _roomRepository.giftList();
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<List<Gift>>(failureOrList);
  }

  Future<ProviderStates> upRoomImg(String path, int roomid) async {
    isChangingImg = true;
    notifyListeners();
    final failureOrRes = await _roomRepository.upRoomImg(path, roomid);
    isChangingImg = false;
    notifyListeners();
    return failureOrDataToState<String>(failureOrRes);
  }

  Future<ProviderStates> setbackgroundImg(String path, int roomid) async {
    isLoading = true;
    notifyListeners();
    final failureOrdone = await _roomRepository.setbackgroundImg(path, roomid);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrdone);
  }

  Future<ProviderStates> getRoomInfoRoom(int id) async {
    isLoadingRoomInfo = true;
    notifyListeners();
    final failureOrRoom = await _roomRepository.getRoomInfo(id);
    isLoadingRoomInfo = false;
    notifyListeners();
    return failureOrDataToState<Room>(failureOrRoom);
  }

  Future<ProviderStates> createRoom(Room room) async {
    isLoading = true;
    notifyListeners();
    final failureOrDone = await _roomRepository.createRoom(room);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrDone);
  }

  Future<ProviderStates> setRoomPassword(String password, int roomId) async {
    isLoading = true;
    notifyListeners();
    final failureOrRes =
        await _roomRepository.setRooomPassword(password, roomId);
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<String>(failureOrRes);
  }
}
