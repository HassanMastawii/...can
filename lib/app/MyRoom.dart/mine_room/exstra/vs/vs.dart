// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/vs/vs_paeg_pepole.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Vs extends StatefulWidget {
  const Vs({super.key});

  @override
  State<Vs> createState() => _VsState();
}

class _VsState extends State<Vs> {
  String selectedNumber = "";
  bool isSendButtonEnabled = false;
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            VsPaegPepole(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset("images/exstra/vs11.png"),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Text(
            "اختر وقت التحدي ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26, width: 2)),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getNumberContainer(nmbaer: "5"),
                getNumberContainer(nmbaer: "10"),
                getNumberContainer(nmbaer: "20"),
                getNumberContainer(nmbaer: "30"),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 44),
          child: MyButton(
            onPressed: isSendButtonEnabled
                ? () {
                    Navigator.pop(context); // Close the bottom sheet
                    _showAlertDialog();
                  }
                : null,
            color: isSendButtonEnabled ? Colors.blue : Colors.white10,
            fontColor: isSendButtonEnabled ? Colors.white : Colors.white70,
            text: "ارسال",
          ),
        )
      ],
    );
  }

  Widget getNumberContainer({required String nmbaer}) {
    bool isSelected = selectedNumber == nmbaer;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNumber = nmbaer;
          isSendButtonEnabled = true;
        });
      },
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.cyanAccent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 3,
          ),
        ),
        child: Center(
          child: Text(
            nmbaer,
            style: TextStyle(
                fontSize: 18, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
