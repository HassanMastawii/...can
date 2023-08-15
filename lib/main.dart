




import 'package:flutter/material.dart';
import 'app/canary_app.dart';
import 'data/datasources/local_database/local_database.dart';
import 'device/dependecy_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initial();
  runApp(const MyApp());
}

Future<void> initial() async {
  await LocalDataSourceImpl.init();
  await initInjections();
}



