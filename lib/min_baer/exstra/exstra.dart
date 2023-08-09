// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Exstra extends StatefulWidget {
  const Exstra({super.key});

  @override
  State<Exstra> createState() => _ExstraState();
}

class _ExstraState extends State<Exstra> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 11.h,
        ),
        Wrap(
          children: [
            Container(
              height: 70,
              width: 70,
              child: Image.asset('images/1.png',fit: BoxFit.fill),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(image: AssetImage())
              // ),
            )
          ],
        )
      ],
    );
  }
}

