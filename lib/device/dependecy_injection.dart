import 'package:canary_app/app/provider/providers/message_provider.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/data/datasources/remote_database/message_remote_repo.dart';
import 'package:canary_app/data/datasources/remote_database/room_remote_repo.dart';
import 'package:canary_app/data/repositories/message_repo_impl.dart';
import 'package:canary_app/data/repositories/room_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../app/provider/providers/core_provider.dart';
import '../data/datasources/local_database/local_database.dart';
import '../data/datasources/remote_database/auth_remote_repo.dart';
import '../data/repositories/auth_repo_impl.dart';

final sl = GetIt.I;

Future<void> initInjections() async {
  //Providers
  sl.registerLazySingleton<CoreProvider>(() => CoreProvider(
        sl(),
      ));
  sl.registerLazySingleton<RoomProvider>(() => RoomProvider(
        sl(),
      ));
  sl.registerLazySingleton<MessageProvider>(() => MessageProvider(
        sl(),
      ));
  //Repositories
  sl.registerLazySingleton<MessageRepository>(() => MessageRepository(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton<RoomRepository>(() => RoomRepository(
        sl(),
        sl(),
      ));
  //Datasources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        sl(),
      ));
  sl.registerLazySingleton<RoomRemoteDataSource>(() => RoomRemoteDataSourceImpl(
        sl(),
      ));
  sl.registerLazySingleton<MessageRemoteDataSource>(
      () => MessageRemoteDataSourceImpl(
            sl(),
          ));
  //device
  sl.registerLazySingleton<Client>(() => Client());
}
