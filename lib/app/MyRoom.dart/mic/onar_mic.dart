import 'package:flutter/material.dart';

class OnarMic extends StatefulWidget {
  const OnarMic({super.key});

  @override
  State<OnarMic> createState() => _OnarMicState();
}

class _OnarMicState extends State<OnarMic> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 35,
            child: CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage("images/pic_room.jpg"),
            ),
          ),
          Text(
            "ali",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
