

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleinRoom extends StatefulWidget {
  const PeopleinRoom({super.key});

  @override
  State<PeopleinRoom> createState() => _PeopleinRoomState();
}

class _PeopleinRoomState extends State<PeopleinRoom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            color: Colors.white30,
            height: 40,
            child: const Center(
                child: Text(
              "On Line 100",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          const Divider(color: Colors.black),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 56,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Card(
                    elevation: 22,
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("user name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const Text("ID:45678980",style: TextStyle(fontSize: 12),),
                              SizedBox(
                                height: 45.h,
                                width: 220.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 70.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/in.png')),
                                      ),
                                      child: const Center(
                                          widthFactor: 33,
                                          heightFactor: 33,
                                          child: Text(
                                            "20",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                    ),
                                    Container(
                                      height: 60.h,
                                      width: 70.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/to.png')),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        "20",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                    ),
                                    Container(
                                      height: 70.h,
                                      width: 80.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/fam.png')),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        "20",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                         const Padding(
                           padding: EdgeInsets.symmetric(horizontal: 11),
                           child: CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.amberAccent,
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage("images/pic_room.jpg"),
                            ),
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
    );
  }
}
