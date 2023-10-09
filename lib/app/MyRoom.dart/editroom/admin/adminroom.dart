// ignore_for_file: avoid_unnecessary_containers

import 'package:canary_app/app/MyRoom.dart/editroom/components_edatRoom/card_admin_and_block.dart';
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
              return CardAdmin(
                v: "ازالة",
              );
            },
          ),
        ),
      ],
    );
  }
}
