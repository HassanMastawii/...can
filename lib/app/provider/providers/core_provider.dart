import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/data/datasources/local_database/local_database.dart';
import 'package:canary_app/domain/usecases/auth/get_my_profile_usecase.dart';
import 'package:canary_app/domain/usecases/auth/get_stored_token_usecase.dart';
import 'package:canary_app/domain/usecases/auth/log_out_usecase.dart';
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
  final GetmyProfileUsecase _getmyProfileUsecase;
  final GetStoredTokenUsecase _getStoredTokenUsecase;
  final LogOutUsecase _logOutUsecase;
  String _themeMode = ThemeMode.system.name;

  CoreProvider(
    this._getThemeUsecase,
    this._setThemeUsecase,
    this._logInUsecase,
    this._registerUsecase,
    this._getmyProfileUsecase,
    this._getStoredTokenUsecase,
    this._logOutUsecase,
  );
  String get themeMode => _themeMode;
  bool isLoading = false;
  bool isLoadingProfile = false;
  Profile? myProfile;
  String? token;
  String? local;
  Future<ProviderStates> logIn(User user) async {
    isLoading = true;
    notifyListeners();
    final failureOrUser = await _logInUsecase(user);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrUser);
  }

  Future<ProviderStates> register(User user) async {
    isLoading = true;
    notifyListeners();
    final failureOrUser = await _registerUsecase(user);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrUser);
  }

  Future<ProviderStates> getMyProfile() async {
    isLoadingProfile = true;
    notifyListeners();
    final failureOrUser = await _getmyProfileUsecase();
    isLoadingProfile = false;
    notifyListeners();
    return failureOrProfileToState(failureOrUser);
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

  Future<void> setLocale(String? locale) async {
    local = locale;
    if (locale != null) {
      await LocalDataSourceImpl.sharedPreferences.setString("locale", locale);
    } else {
      await LocalDataSourceImpl.sharedPreferences.remove("locale");
    }

    notifyListeners();
  }

  getLocale() async {
    local = LocalDataSourceImpl.sharedPreferences.getString("locale");
    notifyListeners();
  }

  getToken() async {
    token = await _getStoredTokenUsecase();
    notifyListeners();
  }

  logOut() async {
    await _logOutUsecase();
    notifyListeners();
  }
}
