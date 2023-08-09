import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../device/dependecy_injection.dart';
import 'pages/Home/home.dart';
import 'themes/dark_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoreProvider>(
          create: (_) => sl<CoreProvider>()..getTheme(),
        ),
      ],
      child: Selector<CoreProvider, String>(
        selector: (_, p1) => p1.themeMode,
        builder: (__, value, _) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) => MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              locale: const Locale("ar"),
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: const Home(),
            ),
          );
        },
      ),
    );
  }
}
