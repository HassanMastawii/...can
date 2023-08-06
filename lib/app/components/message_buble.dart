import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBuble extends StatelessWidget {
  const MessageBuble({
    super.key,
    required this.text,
    required this.username,
    required this.userId,
  });
  final String text;
  final String username;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/pic_room.jpg"),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )),
          width: 220.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 142, 219, 229), fontSize: 14),
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
