// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Praicroom extends StatefulWidget {
  const Praicroom({Key? key}) : super(key: key);

  @override
  State<Praicroom> createState() => _PraicroomState();
}

class _PraicroomState extends State<Praicroom> {
  List<String> items = [
    "سنوي",
    "يومي",
  ];

  int pri = 0;
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("قائمة الدعم", style: TextStyle(fontSize: 18)),
          const Divider(
            height: 11,
          ),
          Container(
            height: 45.h,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: EdgeInsets.symmetric(horizontal: 49.h),
                        width: 80.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: current == index
                                ? Colors.black87
                                : Colors.black45,
                            borderRadius: current == index
                                ? BorderRadius.circular(22)
                                : BorderRadius.circular(15),
                            border: current == index
                                ? Border.all(
                                    color: Colors.amber,
                                    width: 3,
                                  )
                                : null),
                        child: Center(
                          child: Text(
                            items[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
