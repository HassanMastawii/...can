import 'dart:convert';
import 'package:http/http.dart';
import '../../../domain/models/user.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class AuthRemoteDataSource {
  Future<User> logIn(User user);
  Future<User> register(User user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<User> logIn(User user) async {
    var body = user.toJson();
    var res = await client
        .post(
          Uri.parse(logInLink),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(body),
        )
        .timeout(
          const Duration(seconds: 30),
        );
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      if (mapData["errNum"] == "S000") {
        return User.fromJson(mapData["user"]);
      } else {
        throw WrongAuthException(message: mapData["msg"].toString());
      }
    } else {
      throw ServerException(message: res.body);
    }
  }

  @override
  Future<User> register(User user) async {
    var body = user.toJson();
    var res = await client
        .post(
          Uri.parse(registerLink),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(body),
        )
        .timeout(
          const Duration(seconds: 30),
        );
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      if (mapData["errNum"] == "S000") {
        return User.fromJson(mapData["user"]);
      } else {
        throw WrongAuthException(message: mapData["msg"].toString());
      }
    } else {
      throw ServerException(message: res.body);
    }
  }
}
