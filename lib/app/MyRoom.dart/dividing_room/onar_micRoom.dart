// ignore_for_file: file_names

import 'package:canary_app/app/MyRoom.dart/mic/onar_mic.dart';
import 'package:canary_app/app/MyRoom.dart/praicroom/praicroom.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';

class OnarMicRoom extends StatefulWidget {
  final List<UserCoin> userList;
  const OnarMicRoom({super.key, required this.userList});

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
                    return Praicroom(
                      userList: widget.userList,
                    );
                  });
            },
            icon: const Icon(Icons.attach_money_rounded),
            label: Text(
              "${calculateCoins()}",
              style: const TextStyle(color: Colors.yellow),
            )),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnarMic(),
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

  int calculateCoins() {
    int total = 0;
    for (var element in widget.userList) {
      total = total + element.totalCoinAmount;
    }
    return total;
  }
}
