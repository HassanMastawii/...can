import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getToken() {
    return sharedPreferences.getString("token");
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  Future<void> setLocale(String locale) async {
    await LocalDataSource.sharedPreferences.setString("locale", locale);
  }

  String? getLocale() {
    return LocalDataSource.sharedPreferences.getString("locale");
  }

  Future<Unit> removeToken() async {
    await sharedPreferences.remove("token");
    return Future.value(unit);
  }
}
