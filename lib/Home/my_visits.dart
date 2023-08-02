import 'package:canary_app/Home/rooms.dart';
import 'package:canary_app/MyRoom.dart/MyRoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Myvisits extends StatefulWidget {
  const Myvisits({super.key});

  @override
  State<Myvisits> createState() => _MyvisitsState();
}

class _MyvisitsState extends State<Myvisits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
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
                    onPressed: () {
                      Get.off(const Rooms());
                    },
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
                 Get.off(const Rooms());
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
          
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: 56,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          const MyRoom(),
                        );
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
                            Row(
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
                                SizedBox(width: 44.w),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(1),
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
