// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class A3lanRoom extends StatefulWidget {
  const A3lanRoom({super.key});

  @override
  State<A3lanRoom> createState() => _A3lanRoomState();
}

class _A3lanRoomState extends State<A3lanRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Divider(),
          Text(
            "اعلان الغرفه",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Divider(
            color: Colors.black,
            height: 11,
          ),
          Padding(
            padding: EdgeInsets.all(11),
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
