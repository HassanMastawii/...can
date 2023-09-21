import 'dart:convert';
import 'package:canary_app/domain/models/room.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class RoomRemoteDataSource {
  Future<List<Room>> searchRoom(String search, String token);
  Future<Room> getRoomInfo(int id, String token);
  Future<Unit> createRoom(Room room, String token);
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final Client client;

  RoomRemoteDataSourceImpl(this.client);

  @override
  Future<Unit> createRoom(Room room, String token) async {
    var res = await client.post(
      Uri.parse("$createRoomLink?${room.createRoomQuery()}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      return unit;
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<Room> getRoomInfo(int id, String token) async {
    var res = await client.get(
      Uri.parse("$roomInfoLink?room_id=$id"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      return Room.fromJson(mapData);
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<List<Room>> searchRoom(String search, String token) async {
    var res = await client.get(
      Uri.parse("$searchRoomLink?search=$search"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      final List mapData = jsonDecode(res.body);
      return mapData.map((e) => Room.fromJson(e)).toList();
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }
}
