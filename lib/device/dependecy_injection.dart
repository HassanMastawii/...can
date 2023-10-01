import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/data/datasources/remote_database/room_remote_repo.dart';
import 'package:canary_app/data/repositories/room_repo_impl.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:canary_app/domain/usecases/auth/get_my_profile_usecase.dart';
import 'package:canary_app/domain/usecases/auth/get_stored_token_usecase.dart';
import 'package:canary_app/domain/usecases/auth/log_out_usecase.dart';
import 'package:canary_app/domain/usecases/room/create_room_usecase.dart';
import 'package:canary_app/domain/usecases/room/room_info_usecase.dart';
import 'package:canary_app/domain/usecases/room/search_room_usecase.dart';
import 'package:canary_app/domain/usecases/room/up_room_img_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../app/provider/providers/core_provider.dart';
import '../data/datasources/local_database/local_database.dart';
import '../data/datasources/remote_database/auth_remote_repo.dart';
import '../data/repositories/auth_repo_impl.dart';
import '../data/repositories/setting_repo_impl.dart';
import '../domain/repositories/auth_repo.dart';
import '../domain/repositories/setting_repo.dart';
import '../domain/usecases/auth/log_in_usecase.dart';
import '../domain/usecases/auth/register_usecase.dart';
import '../domain/usecases/setting/get_theme_usecase.dart';
import '../domain/usecases/setting/set_theme_usecase.dart';

final sl = GetIt.I;

Future<void> initInjections() async {
  //Providers
  sl.registerLazySingleton<CoreProvider>(() => CoreProvider(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerLazySingleton<RoomProvider>(() => RoomProvider(
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  //Useecases

  //setting
  sl.registerLazySingleton<GetThemeUsecase>(() => GetThemeUsecase(sl()));
  sl.registerLazySingleton<SetThemeUsecase>(() => SetThemeUsecase(sl()));

  //room
  sl.registerLazySingleton<CreateRoomUsecase>(() => CreateRoomUsecase(sl()));
  sl.registerLazySingleton<SearchRoomUsecase>(() => SearchRoomUsecase(sl()));
  sl.registerLazySingleton<RoomInfoUsecase>(() => RoomInfoUsecase(sl()));
  sl.registerLazySingleton<UpRoomImgUsecase>(() => UpRoomImgUsecase(sl()));

  //auth
  sl.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(sl()));
  sl.registerLazySingleton<LogInUsecase>(() => LogInUsecase(sl()));
  sl.registerLazySingleton<LogOutUsecase>(() => LogOutUsecase(sl()));
  sl.registerLazySingleton<GetStoredTokenUsecase>(
      () => GetStoredTokenUsecase(sl()));
  sl.registerLazySingleton<GetmyProfileUsecase>(
      () => GetmyProfileUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<SettingRepository>(() => SettingRepositoryImpl(
        sl(),
      ));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton<RoomRepository>(() => RoomRepositoryImpl(
        sl(),
        sl(),
      ));
  //Datasources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        sl(),
      ));
  sl.registerLazySingleton<RoomRemoteDataSource>(() => RoomRemoteDataSourceImpl(
        sl(),
      ));
  //device
  sl.registerLazySingleton<Client>(() => Client());
}
