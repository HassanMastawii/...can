import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:canary_app/domain/models/backgrounds.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class RoomRemoteDataSource {
  Future<List<Room>> searchRoom(String search, String token);
  Future<List<Background>> getBackgrounds(String token);
  Future<Room> getRoomInfo(int id, String token);
  Future<List<UserCoin>> getUserList(int id, String token);
  Future<List<Gift>> giftList(String token);
  Future<int> checkRomm(String token);
  Future<Unit> createRoom(Room room, String token);
  Future<String> upRoomImg(String path, int id, String token);
  Future<Unit> setBackgroundImg(String path, int id, String token);
  Future<String> setRooomPassword(String password, int id, String token);
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

  @override
  Future<String> upRoomImg(String path, int id, String token) async {
    final url = Uri.parse(upRoomImgLink);

    // Create the multipart request
    final request = MultipartRequest('POST', url);

    // Set the authorization header
    request.headers['Authorization'] = 'Bearer $token';
    request.headers["Content-Type"] = "application/json";
    request.fields["room_id"] = "$id";
    // Add the file to the request
    final file = File(path);
    final fileStream = ByteStream(file.openRead());
    final fileLength = await file.length();
    final fileName = file.path.split('/').last;

    final multipartFile = MultipartFile(
      'image',
      fileStream,
      fileLength,
      filename: fileName,
    );

    request.files.add(multipartFile);
    final response = await request.send();
    var res2 = await Response.fromStream(response);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(res2.body);
      log(path);
      log(decodedResponse.toString());
      final src = decodedResponse['src'];
      return src;
    } else {
      throw ServerException(message: response.statusCode.toString());
    }
  }

  @override
  Future<Unit> setBackgroundImg(String path, int id, String token) async {
    var res = await client.post(
      Uri.parse("$setbackgroundLink?backsrc=$path&room_id=$id"),
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
  Future<String> setRooomPassword(String password, int id, String token) async {
    var res = await client.post(
      Uri.parse("$updateRoomPassLink?password=$password&room_id=$id"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      final mapData = jsonDecode(res.body);
      return mapData["message"];
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<List<Background>> getBackgrounds(String token) async {
    var res = await client.get(
      Uri.parse(getbackgroundsLink),
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
      return mapData.map((e) => Background.fromJson(e)).toList();
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<List<UserCoin>> getUserList(int id, String token) async {
    var res = await client.get(
      Uri.parse("$getUserListLink?room_id=$id"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      final List list = jsonDecode(res.body);
      final List listData = list.first;
      return listData.map((e) => UserCoin.fromJson(e)).toList();
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<List<Gift>> giftList(String token) async {
    var res = await client.get(
      Uri.parse(giftListLink),
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
      return mapData.map((e) => Gift.fromJson(e)).toList();
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<int> checkRomm(String token) async {
    var res = await client.get(
      Uri.parse(checkRoomLink),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    if (res.statusCode == 200) {
      return int.parse(jsonDecode(res.body));
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }
}
