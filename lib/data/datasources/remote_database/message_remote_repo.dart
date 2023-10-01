import 'dart:convert';
import 'package:canary_app/domain/models/message.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class MessageRemoteDataSource {
  Future<List<Message>> getMessages(String token);
  Future<Unit> postMessage(String token, Message message);
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final Client client;

  MessageRemoteDataSourceImpl(this.client);
  @override
  Future<List<Message>> getMessages(String token) async {
    var res = await client.get(
      Uri.parse(getMessagesLink),
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
      return mapData.map((e) => Message.fromJson(e)).toList();
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }

  @override
  Future<Unit> postMessage(String token, Message message) async {
    var res = await client.post(
      Uri.parse("$getMessagesLink?${message.postQuery()}"),
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
}
