// ignore_for_file: file_names

import 'package:canary_app/app/MyRoom.dart/mic/mic.dart';
import 'package:flutter/material.dart';

class MicatinRoom extends StatefulWidget {
  const MicatinRoom({super.key});

  @override
  State<MicatinRoom> createState() => _MicatinRoomState();
}

class _MicatinRoomState extends State<MicatinRoom> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Mic(),
              Mic(),
              Mic(),
              Mic(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Mic(),
              Mic(),
              Mic(),
              Mic(),
            ],
          ),
        ),
      ],
    );
  }
}
