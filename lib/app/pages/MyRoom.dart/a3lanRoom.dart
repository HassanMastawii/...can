// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class A3lanRoom extends StatefulWidget {
  const A3lanRoom({super.key});

  @override
  State<A3lanRoom> createState() => _A3lanRoomState();
}

class _A3lanRoomState extends State<A3lanRoom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
         height: 11,
        ),
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
    );
  }
}
