import 'dart:convert';
import 'dart:io';
import 'package:canary_app/domain/models/room.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class RoomRemoteDataSource {
  Future<List<Room>> searchRoom(String search, String token);
  Future<Room> getRoomInfo(int id, String token);
  Future<Unit> createRoom(Room room, String token);
  Future<String> upRoomImg(String path, String token);
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
  Future<String> upRoomImg(String path, String token) async {
    final url = Uri.parse(upRoomImgLink);

    // Create the multipart request
    final request = MultipartRequest('POST', url);

    // Set the authorization header
    request.headers['Authorization'] = 'Bearer $token';
    request.headers["Content-Type"] = "application/json";

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
      // contentType: MediaType('image', 'jpeg'), // Adjust the content type based on your file type
    );

    request.files.add(multipartFile);
    final response = await request.send();
    var res2 = await Response.fromStream(response);
    if (response.statusCode == 200) {
      print(res2.body);
      final decodedResponse = jsonDecode(res2.body);
      final src = decodedResponse['src'];
      return src;
    } else {
      throw ServerException(message: response.statusCode.toString());
    }
  }
}
