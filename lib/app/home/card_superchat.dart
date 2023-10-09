import 'package:canary_app/app/MyRoom.dart/my_room.dart';

import 'package:flutter/material.dart';

class SuperChat extends StatelessWidget {
  const SuperChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MyRoom(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(11),
              color: Colors.amberAccent[100]),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("images/pic_room.jpg"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("user neam"),
                  Text("massig massig massig"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
