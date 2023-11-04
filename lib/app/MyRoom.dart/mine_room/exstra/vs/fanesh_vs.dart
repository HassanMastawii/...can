// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FenashVs extends StatefulWidget {
  const FenashVs({super.key});

  @override
  State<FenashVs> createState() => _FenashVsState();
}

class _FenashVsState extends State<FenashVs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 33,
            backgroundImage: const AssetImage("images/pic_room.jpg"),
          ),
        ),
        Text(
          "user name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "لقد فاز بمساعدة اصدقائه",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 130,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 10,
                right: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 33,
                  backgroundImage: const AssetImage("images/pic_room.jpg"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundImage: const AssetImage("images/pic_room.jpg"),
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundImage: const AssetImage("images/pic_room.jpg"),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
