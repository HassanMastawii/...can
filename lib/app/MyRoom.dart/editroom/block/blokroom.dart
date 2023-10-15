// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:canary_app/app/MyRoom.dart/editroom/components_edatRoom/card_admin_and_block.dart';

import 'package:flutter/material.dart';

class Blokroom extends StatefulWidget {
  const Blokroom({super.key});

  @override
  State<Blokroom> createState() => _BlokroomState();
}

class _BlokroomState extends State<Blokroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("ادارة الطرد",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          const Divider(
            height: 11,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 44,
              itemBuilder: (context, index) {
                // ignore: sized_box_for_whitespace
                return CardAdmin(
                  v: "فك الحظر",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
