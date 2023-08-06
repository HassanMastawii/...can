import 'package:flutter/material.dart';

import '../../../domain/usecases/setting/get_theme_usecase.dart';
import '../../../domain/usecases/setting/set_theme_usecase.dart';

class CoreProvider extends ChangeNotifier {
  final GetThemeUsecase _getThemeUsecase;
  final SetThemeUsecase _setThemeUsecase;
  String _themeMode = ThemeMode.system.name;

  CoreProvider(this._getThemeUsecase, this._setThemeUsecase);
  String get themeMode => _themeMode;

  changeTheme(String theme) async {
    _themeMode = theme;
    await _setThemeUsecase(theme);
    notifyListeners();
  }

  getTheme() async {
    _themeMode = await _getThemeUsecase();
    notifyListeners();
  }
}
