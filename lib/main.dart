


import 'package:canary_app/Home/home.dart';

import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: const Home(),
        );
      },
    );
  }
}
