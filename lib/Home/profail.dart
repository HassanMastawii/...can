// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:canary_app/profail/edit_provail.dart';
import 'package:canary_app/profail/franedgroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profail extends StatefulWidget {
  const Profail({super.key});

  @override
  State<Profail> createState() => _Profail();
}

class _Profail extends State<Profail> {
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
      backgroundColor: const Color.fromRGBO(144, 202, 249, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 33.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () {
                      Get.to(const EditProfail());
                    },
                    icon: const Icon(
                      Icons.edit_note,
                      size: 40,
                    )),
                const Spacer(flex: 4),
                Column(
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: const Color.fromARGB(207, 255, 224, 85)),
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage('images/pic_room.jpg'))),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 25.h,
                      child: const Text(
                        "user name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 8),
              ],
            ),
            Container(
              height: 33.h,
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.library_add_rounded)),
                  const Text("ID: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const Text("1234567890",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child:
                      Stack(alignment: const Alignment(-1 / 2, 0), children: [
                    Container(
                      width: 44.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage("images/11.png")),
                        // color: Colors.redAccent
                      ),
                    ),
                    const Text(
                      "22",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ),
                const Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child:
                      Stack(alignment: const Alignment(-1 / 2, 0), children: [
                    Container(
                      width: 44.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage("images/11.png")),
                        // color: Colors.redAccent
                      ),
                    ),
                    const Text(
                      "22",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ),
                const Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child:
                      Stack(alignment: const Alignment(-1 / 2, 0), children: [
                    Container(
                      width: 44.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/fam.png")),
                        // color: Colors.redAccent
                      ),
                    ),
                    const Text(
                      "22",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    // border: Border.all(width: 1, color: Colors.black54),
                    // borderRadius: BorderRadius.circular(11),
                    ),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "الزوار",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            "55",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "متابع",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            "55",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "متابعين",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            "55",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(onTap: () {
                      Get.to(const FranedGroup());
                    },
                      child: Container(
                        child: Column(
                          children: const [
                            Text(
                              "اصدقاء",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "55",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(width: 2, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(11),
                    // image: DecorationImage(
                    //     fit: BoxFit.fill, image: AssetImage('images/to.png')))),
                  ),
                  child: Center(child: Image.asset('images/vip.png')),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.h,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        border: Border.all(
                            width: 2,
                            color: Colors.black45,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "المستوى",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "22",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(Icons.upload,
                                    color: Colors.yellowAccent[700], size: 33),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.h,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.brown[400],
                        border: Border.all(
                            width: 2,
                            color: Colors.black45,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            " الشحن",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "557826763",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(Icons.paid_outlined,
                                    color: Colors.yellowAccent[700], size: 33),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                        // color: Colors.brown[700],
                        image: DecorationImage(
                            image: AssetImage("images/s1.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Text(
                            "الشارة",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                        // color: Colors.brown[700],
                        image: DecorationImage(
                            image: AssetImage("images/f1.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Text(
                            "العائلة",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: const BoxDecoration(
                          // color: Colors.brown[700],
                          image: DecorationImage(
                              image: AssetImage("images/m1.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: Text(
                              "المتجر",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: const BoxDecoration(
                          // color: Colors.brown[700],
                          image: DecorationImage(
                              image: AssetImage("images/d11.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: Text(
                              "الدخل",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "دعوة الاصدقاء",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Icon(
                              Icons.ac_unit_sharp,
                              size: 44,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "الأعدادات",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Icon(
                              Icons.ac_unit_sharp,
                              size: 44,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "المساعدة وردود الفعل",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Icon(
                              Icons.ac_unit_sharp,
                              size: 44,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
