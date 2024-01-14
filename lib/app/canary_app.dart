// import 'dart:io';
// import 'package:canary_app/app/home/button_navgetion_bar.dart';
// import 'package:canary_app/app/provider/providers/core_provider.dart';
// import 'package:canary_app/app/themes/light_theme.dart';
// import 'package:canary_app/app/welcome/auth/Login.dart';
// import 'package:canary_app/device/locale/locale.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'themes/dark_theme.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// final navigatorKey = GlobalKey<NavigatorState>();

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       useInheritedMediaQuery: true,
//       splitScreenMode: false,
//       builder: (_, __) => MaterialApp(
//         navigatorKey: navigatorKey,
//         localizationsDelegates: const [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           AppLocale.delegate,
//         ],
//         supportedLocales: const [
//           Locale('ar'),
//           Locale('en'),
//         ],
//         locale: Locale(local ?? getLanguageCode(Platform.localeName)),
//         darkTheme: darkTheme,
//         themeMode: ThemeMode.light,
//         theme: lightTheme,
//         debugShowCheckedModeBanner: false,
//         home: context.read<CoreProvider>().token == null
//             ? const Login()
//             : const Home(),
//       ),
//     );
//   }
// }

// String getLanguageCode(String localeString) {
//   // Split the locale string into the language code and the country code.
//   List<String> parts = localeString.split('_');

//   // Return the language code.
//   return parts[0];
// }
