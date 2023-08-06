// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TheText extends StatefulWidget {
  const TheText({super.key});

  @override
  State<TheText> createState() => _TheTextState();
}

class _TheTextState extends State<TheText> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            height: 70.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                children: [
                  Container(
                    width: 254.w,
                    child: const TextField(
                      decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(33))),
                          hintTextDirection: TextDirection.ltr,
                          fillColor: Colors.amber,
                          focusColor: Colors.amber,
                          helperStyle:
                              TextStyle(color: Colors.white, fontSize: 22),
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 22),
                          hoverColor: Colors.blueGrey,
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 22)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.send,
                      size: 40,
                    ),
                  ),
                  const Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
