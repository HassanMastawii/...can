// ignore_for_file: sized_box_for_whitespace

import 'package:canary_app/Home/my_visits.dart';
import 'package:canary_app/MyRoom.dart/MyRoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  // List room = [
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  //   {"img": "images/1.png", "name": "canary Chat", "contry": "syria"},
  // ];

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return Scaffold(backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          SizedBox(height: 33.h),
          const Divider(color: Colors.black, height: 5, endIndent: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 360.w,
              height: 75.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("images/bnar1.png"))),
            ),
          ),
          Container(
            height: 44.h,
            width: 360.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        const MyRoom(),
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    iconSize: 35,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Trend',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(const Myvisits());
                    },
                    child: const Text(
                      'My Visits',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 70.h,
              width: 360.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 2, color: Colors.black54),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("uesr name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("masseg masseg masseg",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: const Color.fromARGB(207, 255, 224, 85)),
                        borderRadius: BorderRadius.circular(90),
                        image: const DecorationImage(
                            image: AssetImage('images/pic_room.jpg'))),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8),
            child: Container(color: Colors.white,
              height:400 .h,
              width: 360.w,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 56,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {
                    Get.to(const MyRoom(),);
                  },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/2.png"),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(125, 0, 0, 0),
                                ),
                                child: const Text(
                                  'syria',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                           
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(125, 0, 0, 0),
                                  ),
                                  child: const Text(
                                    'كناري شات',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
