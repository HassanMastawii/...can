// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adminroom extends StatefulWidget {
  const Adminroom({super.key});

  @override
  State<Adminroom> createState() => _AdminroomState();
}

class _AdminroomState extends State<Adminroom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("ادارة المشرفين",
            style: TextStyle(color: Colors.black, fontSize: 18)),
        const Divider(
          height: 11,
          color: Colors.black,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              // ignore: sized_box_for_whitespace
              return Container(
                width: double.infinity,
                height: 80.h,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(33)),
                            child: const Center(
                              child: Text(
                                "ازالة",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("user name",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text("ID:45678980"),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 11),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: const Color.fromARGB(
                                          207, 255, 224, 85)),
                                  borderRadius: BorderRadius.circular(45),
                                  color: Colors.black,
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('images/pic_room.jpg'))),
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
    );
  }
}
