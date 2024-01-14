import 'package:flutter/material.dart';

class ListePicAndName extends StatelessWidget {
  const ListePicAndName({
    Key? key,
    required this.nemberRanking,
    this.colorRankig,
  });
  final String nemberRanking;
  final Color? colorRankig;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: colorRankig,
          child: Text(
            nemberRanking,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 38,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/pic_room.jpg"),
              radius: 36,
            ),
          ),
        ),
        const Text(
          "hassan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text("ID:123456789"),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "999 K",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
