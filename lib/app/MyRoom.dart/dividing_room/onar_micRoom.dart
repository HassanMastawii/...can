import 'package:canary_app/app/MyRoom.dart/praicroom/praicroom.dart';
import 'package:flutter/material.dart';

class OnarMicRoom extends StatefulWidget {
  const OnarMicRoom({super.key});

  @override
  State<OnarMicRoom> createState() => _OnarMicRoomState();
}

class _OnarMicRoomState extends State<OnarMicRoom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black54),
              iconColor: MaterialStatePropertyAll(Colors.yellow),
              side: MaterialStatePropertyAll(
                BorderSide(color: Colors.amber),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Praicroom(
                      userList: [],
                    );
                  });
            },
            icon: const Icon(Icons.attach_money_rounded),
            label: const Text(
              "1000",
              style: TextStyle(color: Colors.yellow),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getMember(),
          ],
        ),
      ],
    );
  }

  Widget getMember({double rbig = 35, double rsmall = 33}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: rbig,
            child: CircleAvatar(
              radius: rsmall,
              backgroundImage: const AssetImage("images/pic_room.jpg"),
            ),
          ),
          const Text(
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
