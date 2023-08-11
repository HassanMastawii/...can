// ignore_for_file: sized_box_for_whitespace

import 'package:canary_app/app/pages/MyRoom.dart/praicday.dart';
import 'package:canary_app/app/pages/MyRoom.dart/praicmonthe.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Praicroom extends StatefulWidget {
  const Praicroom({Key? key}) : super(key: key);

  @override
  State<Praicroom> createState() => _PraicroomState();
}

class _PraicroomState extends State<Praicroom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageViewExample(),
        Card(elevation: 22,
        
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 8),
            child: Row(
              children: [
                MyButton(
                    text: "يومي",
                    fontColor: Colors.white,
                    color: Colors.blueAccent[700]),
                const Spacer(),
                MyButton(
                    text: "سنوي",
                    fontColor: Colors.white,
                    color: Colors.blueAccent[700]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PageViewExample extends StatelessWidget {
  final List<Widget> pages = [
    const Praicday(),
    const Praicmonthe(),
  ];

  PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
      ),
    );
  }
}
