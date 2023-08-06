import 'package:dartz/dartz.dart';
import '../../domain/repositories/setting_repo.dart';
import '../datasources/local_database/local_database.dart';

class SettingRepositoryImpl implements SettingRepository {
  final LocalDataSource _localDataSource;

  SettingRepositoryImpl(
    this._localDataSource,
  );

  @override
  Future<String> getThemeMode() async {
    return await _localDataSource.getThemeMode();
  }

  @override
  Future<Unit> setThemeMode(String theme) async {
    return await _localDataSource.setThemeMode(theme);
  }
}
