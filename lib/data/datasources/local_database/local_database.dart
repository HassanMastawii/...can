import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<String> getThemeMode();
  Future<Unit> setThemeMode(String themeMode);
}

class LocalDataSourceImpl implements LocalDataSource {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<Unit> setThemeMode(String themeMode) async {
    await sharedPreferences.setString("ThemeMode", themeMode);
    return Future.value(unit);
  }

  @override
  Future<String> getThemeMode() async {
    final isDarkMode = sharedPreferences.getString("ThemeMode");
    if (isDarkMode == null) {
      setThemeMode(ThemeMode.system.name);
      return Future.value(ThemeMode.system.name);
    } else {
      return Future.value(isDarkMode);
    }
  }
}