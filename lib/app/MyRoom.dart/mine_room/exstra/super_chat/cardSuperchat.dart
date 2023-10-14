// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CardSuperchat extends StatefulWidget {
  const CardSuperchat({Key? key}) : super(key: key);

  @override
  State<CardSuperchat> createState() => _CardSuperchatState();
}

class _CardSuperchatState extends State<CardSuperchat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 23,
              backgroundImage: const AssetImage("images/pic_room.jpg"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hassan",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Container(
                height: 25,
                width: 220,
                child: Marquee(
                  text:
                      "masseg masseg masseg massegmasseg massegmasseg massegmasseg masseg",
                  style: TextStyle(color: Colors.white),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  blankSpace: 20.0, // المسافة بين الدورة
                  velocity: 100.0, // سرعة التمرير
                  pauseAfterRound: Duration(seconds: 1), // الوقف بعد كل دورة
                  startPadding: 10.0, // المسافة من البداية
                  accelerationDuration: Duration(seconds: 1), // مدة التسارع
                  accelerationCurve: Curves.linear, // منحنى التسارع
                  decelerationDuration:
                      Duration(milliseconds: 500), // مدة التباطؤ
                  decelerationCurve: Curves.easeOut, // منحنى التباطؤ
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
