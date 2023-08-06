import 'package:dartz/dartz.dart';
import '../../repositories/setting_repo.dart';

class SetThemeUsecase {
  final SettingRepository repository;

  SetThemeUsecase(this.repository);

  Future<Unit> call(String theme) async {
    return await repository.setThemeMode(theme);
  }
}
