// ignore_for_file: prefer_const_constructors

import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/vs/fanesh_vs.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class VsPaegPepole extends StatefulWidget {
  const VsPaegPepole({super.key});

  @override
  State<VsPaegPepole> createState() => _VsPaegPepoleState();
}

class _VsPaegPepoleState extends State<VsPaegPepole> {
  void _showAlertDialogfenash() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: const [
            FenashVs(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 33,
                      backgroundImage: const AssetImage("images/pic_room.jpg"),
                    ),
                  ),
                  MyButton(
                      onPressed: () {},
                      color: Colors.red,
                      fontColor: Colors.white,
                      text: "انضمام"),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: Image.asset("images/exstra/vs11.png"),
              ),
              Spacer(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 33,
                      backgroundImage: const AssetImage("images/pic_room.jpg"),
                    ),
                  ),
                  MyButton(
                      onPressed: () {},
                      color: Colors.blue,
                      fontColor: Colors.white,
                      text: "انضمام"),
                ],
              ),
            ],
          ),
        ),
        Text("لاعب واحد من كل فريق لازم عليه النضمام من كل فريق"),
        Text("وقت التحدي هو 10 دقائق"),
        MyButton(
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialogfenash();
            },
            color: Colors.brown,
            fontColor: Colors.white,
            text: "البدء")
      ],
    );
  }
}
