import 'package:canary_app/app/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/home/room_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myvisits extends StatefulWidget {
  const Myvisits({super.key});

  @override
  State<Myvisits> createState() => _MyvisitsState();
}

class _MyvisitsState extends State<Myvisits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 44.h,
            width: 360.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyRoom(),
                      ));
                    },
                    icon: const Icon(
                      Icons.home,
                    ),
                    iconSize: 35,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'رائج',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 56,
                itemBuilder: (context, index) {
                  return RoomCard(
                    roomstatus: "قران",
                    chatCountry: "سوريا",
                    chatName: "شات العرب",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyRoom(),
                      ));
                    },
                    imageLink: "images/2.png",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
