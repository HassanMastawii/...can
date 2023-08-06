import 'package:get_it/get_it.dart';

import '../app/provider/providers/core_provider.dart';
import '../data/datasources/local_database/local_database.dart';
import '../data/repositories/setting_repo_impl.dart';
import '../domain/repositories/setting_repo.dart';
import '../domain/usecases/setting/get_theme_usecase.dart';
import '../domain/usecases/setting/set_theme_usecase.dart';

final sl = GetIt.I;

Future<void> initInjections() async {
  //Providers
  sl.registerLazySingleton<CoreProvider>(() => CoreProvider(
        sl(),
        sl(),
      ));

  //Useecases

  //setting
  sl.registerLazySingleton<GetThemeUsecase>(() => GetThemeUsecase(sl()));
  sl.registerLazySingleton<SetThemeUsecase>(() => SetThemeUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<SettingRepository>(() => SettingRepositoryImpl(
        sl(),
      ));
  //Datasources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
