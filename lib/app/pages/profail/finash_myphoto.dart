import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinashMyPhoto extends StatefulWidget {
  const FinashMyPhoto({super.key});

  @override
  State<FinashMyPhoto> createState() => _FinashMyPhotoState();
}

class _FinashMyPhotoState extends State<FinashMyPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 202, 249, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Center(
              child: Container(
                height: 33.h,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.blueAccent[700],
                ),
                child: const Center(
                    child: Text(
                  "القواعد",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: double.infinity,
              height: 302.h,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                children: [
                  const Text(
                    "قواعد تغير الصوره الشخصيه",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120.w,
                          height: 33.h,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[700],
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "قواعد التغير",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                        Container(
                          width: 120.w,
                          height: 33.h,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[700],
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "الثرة",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "مره1 /يوم",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                        Container(
                            width: 140.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(22)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 11),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Image.asset("images/lv.png"),
                                  const Text("10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                   Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "مرة2 /يوم",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                        Container(
                            width: 140.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(22)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 11),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "11",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Image.asset("images/lv.png"),
                                  const Text("20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                   Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "مره3/يوم",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                        Container(
                            width: 140.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(22)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 11),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "21",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Image.asset("images/lv.png"),
                                  const Text("30",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                   Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                              child: Text(
                            "---/يوم",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1),
                          )),
                        ),
                        Container(
                            width: 140.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(22)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 11),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "31",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Image.asset("images/lv.png"),
                                  const Text("---",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Center(
              child: InkWell(onTap: () {
                // Get.off(const EditProfail());
              },
                child: Container(
                  height: 33.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Colors.blueAccent[700],
                  ),
                  child: const Center(
                      child: Text(
                    "انهاء",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
