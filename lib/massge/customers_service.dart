// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomersService extends StatefulWidget {
  const CustomersService({super.key});

  @override
  State<CustomersService> createState() => _CustomersServiceState();
}

class _CustomersServiceState extends State<CustomersService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: [ Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: const Text(
                          "Customers Service",
                          style: TextStyle(
                              color: Colors.white,
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
                                  color: Colors.white,
                                )),
                            const Text(
                              "ID: ",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              "Canary Chat",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11, right: 11),
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
              ),],
    ),
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            
            Container(
              width: double.infinity,
              height: 531.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              )),
                          height: 55.h,
                          width: 222.w,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "hello",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, right: 11),
                          child: Container(
                            width: 55.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("images/pic_room.jpg")),
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 11, right: 11),
                          child: Container(
                            width: 55.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("images/pic_room.jpg")),
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              )),
                          height: 55.h,
                          width: 222.w,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "wellcom",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.h,
              color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings_voice,
                          size: 44,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          size: 44,
                          color: Colors.white,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.all(Radius.circular(22))),
                        height: 44.h,
                        width: 190.w,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                          
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          size: 44,
                          color: Colors.white,
                        )),
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