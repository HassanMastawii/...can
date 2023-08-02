// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:canary_app/massge/customers_service.dart';
import 'package:canary_app/massge/masseg_prifet.dart';
import 'package:canary_app/massge/notifications.dart';
import 'package:canary_app/profail/ferind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Masseg extends StatefulWidget {
  const Masseg({super.key});

  @override
  State<Masseg> createState() => _MassegState();
}

class _MassegState extends State<Masseg> {
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
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          children: [
            Divider(
              color: Colors.black12,
              height: 40.h,
            ),
            Container(
              width: double.infinity,
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const Ferind());
                      },
                      child: const Text("الاصدقاء",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("الرسائل",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(33)),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 40.h,
              child: TextButton(
                onPressed: () {
                  Get.to(const CustomersService());
                },
                child: const Text("خدمة العملاء",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            InkWell(
              onTap: () {
                Get.to(const Notifications());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black),
                  borderRadius: BorderRadius.circular(44),
                  color: Colors.white,
                ),
                height: 40.h,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  "اشعارات النضام",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              height: 453.h,
              decoration: const BoxDecoration(
                // border: Border.all(
                //     width: 1,
                //     strokeAlign: BorderSide.strokeAlignCenter,
                //     color: Colors.black),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(33),
                    topRight: Radius.circular(33)),
                color: Colors.white,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 56,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(const MassegPraifet());
                    },
                    child: Card(
                      elevation: 11,
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text("22:23"),
                                    SizedBox(width: 155.w),
                                    const Text(
                                      "user name",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 11),
                                  child: Text(
                                    "   idppiisgvviiyvbiuidsyاخر رساله",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11,right: 11),
                              child: Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage("images/pic_room.jpg")),
                                  borderRadius: BorderRadius.circular(45),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
