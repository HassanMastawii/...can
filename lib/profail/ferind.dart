// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ferind extends StatefulWidget {
  const Ferind({super.key});

  @override
  State<Ferind> createState() => _FerindState();
}

class _FerindState extends State<Ferind> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
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
              height: 12.h,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44))),
              width: double.infinity,
              height: 598.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 56,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 11,
                      child: Container(
                        width: double.infinity,
                        height: 88.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 14.h,
                                    child: const Text(
                                      "user name",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 24.h,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.library_add_rounded,
                                              size: 15,
                                            )),
                                        const Text("ID: "),
                                        const Text("1234567890"),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: const Alignment(-1 / 2, 0),
                                          children: [
                                            Container(
                                              width: 44.w,
                                              height: 30.h,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/11.png")),
                                                // color: Colors.redAccent
                                              ),
                                            ),
                                            const Text(
                                              "22",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Stack(
                                            alignment:
                                                const Alignment(-1 / 2, 0),
                                            children: [
                                              Container(
                                                width: 44.w,
                                                height: 30.h,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/11.png")),
                                                  // color: Colors.redAccent
                                                ),
                                              ),
                                              const Text(
                                                "22",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ]),
                                      ),
                                      Stack(
                                          alignment: const Alignment(-1 / 2, 0),
                                          children: [
                                            Container(
                                              width: 44.w,
                                              height: 30.h,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/11.png")),
                                                // color: Colors.redAccent
                                              ),
                                            ),
                                            const Text(
                                              "22",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8),
                              child: Container(
                                width: 80.w,
                                height: 80.h,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22)),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/pic_room.jpg"))),
                              ),
                            )
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
