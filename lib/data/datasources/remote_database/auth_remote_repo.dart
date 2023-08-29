import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../../domain/models/user.dart';
import '../../errors/exceptions.dart';
import 'links.dart';

abstract class AuthRemoteDataSource {
  Future<String> logIn(User user);
  Future<String> register(User user);
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
    print(res.statusCode);
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      return mapData["token"];
    } else if (res.statusCode == HttpStatus.unauthorized) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      throw ServerException(message: mapData["error"]);
    } else {
      throw ServerException(message: res.body);
    }
  }

  @override
  Future<String> register(User user) async {
    var res = await client.post(
      Uri.parse("$registerLink?${user.toQuery()}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ).timeout(
      const Duration(seconds: 30),
    );
    print(res.body);
    if (res.statusCode == 201) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      return mapData["token"];
    } else if (res.statusCode == 422) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      // final emailerror = cast<List?>(mapData["errors"]?["email"]) ?? [];
      // final nameerror = cast<List?>(mapData["errors"]?["name"]) ?? [];
      // final passworderror = cast<List?>(mapData["errors"]?["password"]) ?? [];
      throw RegisterException(
        message: mapData["message"],
        // email: emailerror.isNotEmpty ? emailerror.first : null,
        // name: nameerror.isNotEmpty ? nameerror.first : null,
        // password: passworderror.isNotEmpty ? passworderror.first : null,
      );
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
    print(res.body);
    if (res.statusCode == 200) {
      final Map<String, dynamic> mapData = jsonDecode(res.body);
      return Profile.fromJson(mapData["user"]);
    } else {
      throw ServerException(message: res.statusCode.toString() + res.body);
    }
  }
}
