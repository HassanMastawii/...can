import 'package:canary_app/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInRoom extends StatefulWidget {
  const ChatInRoom({super.key});

  @override
  State<ChatInRoom> createState() => _ChatInRoomState();
}

class _ChatInRoomState extends State<ChatInRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                size: 33,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 33,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Container(child: const MyTextField(
                
              )),
            ),
          )
        ],
      ),
    );
  }
}
