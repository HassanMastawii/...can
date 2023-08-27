import 'dart:convert';
import 'package:http/http.dart';
import '../../../domain/models/user.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class AuthRemoteDataSource {
  Future<String> logIn(User user);
  Future<User> register(User user);
  Future<Profile> getMyProfile(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<String> logIn(User user) async {
    var res = await client.post(
      Uri.parse("$logInLink?${user.toQuery()}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    print(res.body);
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      return mapData["token"];
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
        throw NotLogedInException(message: mapData["msg"].toString());
      }
    } else {
      throw ServerException(message: res.body);
    }
  }

  @override
  Future<Profile> getMyProfile(String token) async {
    var res = await client.get(
      Uri.parse(getMyProfileLink),
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
      return Profile.fromJson(mapData["user"]);
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }
}
