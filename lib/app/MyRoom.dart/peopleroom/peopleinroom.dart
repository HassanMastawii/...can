// ignore_for_file: sized_box_for_whitespace

import 'package:canary_app/app/components/image_handler.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleinRoom extends StatefulWidget {
  const PeopleinRoom({super.key, required this.userList});
  final List<UserCoin> userList;

  @override
  State<PeopleinRoom> createState() => _PeopleinRoomState();
}

class _PeopleinRoomState extends State<PeopleinRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.white30,
                height: 40,
                child: Center(
                    child: Text(
                  "OnLine ${widget.userList.length}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const Divider(color: Colors.black),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.userList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        elevation: 22,
                        child: Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 11),
                                    child: Text(widget.userList[index].username,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Text("ID:${widget.userList[index].userId}"),
                                  Container(
                                    height: 45,
                                    width: 220.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 70,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/in.png')),
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
                                                image: AssetImage(
                                                    'images/to.png')),
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
                                                image: AssetImage(
                                                    'images/fam.png')),
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4,
                                          color: const Color.fromARGB(
                                              207, 255, 224, 85)),
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.black,
                                    ),
                                    child: ImageHandler(
                                        path: widget.userList[index].userPic)),
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
      ),
    );
  }
}
