import 'package:flutter/material.dart';

class Mic extends StatefulWidget {
  const Mic({super.key});

  @override
  State<Mic> createState() => _MicState();
}

class _MicState extends State<Mic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 30,
            child: CircleAvatar(
              radius: 29,
              backgroundImage: AssetImage("images/pic_room.jpg"),
            ),
          ),
          Text(
            "mic",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
