import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/data/repositories/auth_repo_impl.dart';
import 'package:canary_app/domain/models/profile.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';

class CoreProvider extends ChangeNotifier with StatesHandler {
  // كلاس لادارة حالة عمليات تسجيل الدخول ولغة التطبيق والتوكن المخزنة محليا
  final AuthRepository _authRepository;

  CoreProvider(
    this._authRepository,
  );
  bool isLoading = false;
  bool isLoadingProfile = false;
  Profile? myProfile;
  String? local;
  String? token;
  Future<ProviderStates> logIn(User user) async {
    isLoading = true;
    notifyListeners();
    final failureOrUser = await _authRepository.logIn(user);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrUser);
  }

  Future<ProviderStates> register(User user) async {
    isLoading = true;
    notifyListeners();
    final failureOrUser = await _authRepository.register(user);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrUser);
  }

  //لجلب الملف الشخصي من السيرفر
  Future<ProviderStates> getMyProfile() async {
    isLoadingProfile = true;
    notifyListeners();
    final failureOrUser = await _authRepository.getMyProfile();
    isLoadingProfile = false;
    notifyListeners();
    return failureOrDataToState<Profile>(failureOrUser);
  }

  //لتسجيل الخروج وحذف التوكن المخزن محليا
  logOut() async {
    token = null;
    await _authRepository.logOut();
    notifyListeners();
  }

  //جلب التوكن المخزن محليا
  getToken() async {
    token = await _authRepository.getStoredToken();
    notifyListeners();
  }

  // جلب لغة التطبيق المخزنة محليا
  getLocal() async {
    local = await _authRepository.getLocale();
    notifyListeners();
  }

  //تغيير لغة التطبيق المخزنة محليا
  setLocal(String locale) async {
    local = locale;
    await _authRepository.setLocale(locale);
    notifyListeners();
  }
}
