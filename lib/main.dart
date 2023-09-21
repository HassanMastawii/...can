import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/canary_app.dart';
import 'app/provider/providers/core_provider.dart';
import 'data/datasources/local_database/local_database.dart';
import 'device/dependecy_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initial();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CoreProvider>(
          create: (_) => sl<CoreProvider>()
            ..getTheme()
            ..getToken()
            ..getLocale(),
        ),
        ChangeNotifierProvider<RoomProvider>(
          create: (_) => sl<RoomProvider>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> initial() async {
  await LocalDataSourceImpl.init();
  await initInjections();
}
