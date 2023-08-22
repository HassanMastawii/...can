import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';
import '../../../domain/usecases/auth/log_in_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import '../../../domain/usecases/setting/get_theme_usecase.dart';
import '../../../domain/usecases/setting/set_theme_usecase.dart';

class CoreProvider extends ChangeNotifier with StatesHandler {
  final GetThemeUsecase _getThemeUsecase;
  final SetThemeUsecase _setThemeUsecase;
  final LogInUsecase _logInUsecase;
  final RegisterUsecase _registerUsecase;
  String _themeMode = ThemeMode.system.name;

  CoreProvider(
    this._getThemeUsecase,
    this._setThemeUsecase,
    this._logInUsecase,
    this._registerUsecase,
  );
  String get themeMode => _themeMode;
  bool isLoading = false;

  Future<ProviderStates> logIn(User user) async {
    isLoading = true;
    notifyListeners();
    final failureOrUser = await _logInUsecase(user);
    isLoading = false;
    notifyListeners();
    return failureOrUserToState(failureOrUser);
  }

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
