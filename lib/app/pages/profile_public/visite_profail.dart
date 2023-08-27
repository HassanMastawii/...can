import 'package:canary_app/app/pages/profile_public/slidephoto.dart';
import 'package:flutter/material.dart';

class VisiteProfail extends StatefulWidget {
  const VisiteProfail({super.key});

  @override
  State<VisiteProfail> createState() => _VisiteProfailState();
}

class _VisiteProfailState extends State<VisiteProfail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height:250,
          color: Colors.black26,
          child: Stack(alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  height: 200,
                  child: Slaidphoto(),
                ),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/pic_room.jpg"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
