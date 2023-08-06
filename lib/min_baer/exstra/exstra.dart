// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Exstra extends StatefulWidget {
  const Exstra({super.key});

  @override
  State<Exstra> createState() => _ExstraState();
}

class _ExstraState extends State<Exstra> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  height: 100, width: 100,
                  // color: Colors.blueAccent,
                  // decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         fit: BoxFit.fill, image: AssetImage('images/m.png'))),
                  // // child: Image.asset("images/exstra/m.png")),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
