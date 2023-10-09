// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:canary_app/app/MyRoom.dart/editroom/components_edatRoom/card_status.dart';

import 'package:flutter/material.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.black12,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 30,
            child: const Text(
              "الحالة",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(color: Colors.black, height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardStatus(h: "دردشه"),
              CardStatus(h: "قرءان"),
              CardStatus(h: "عشوائي"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardStatus(h: "صداقه"),
              CardStatus(h: "شعر"),
              CardStatus(h: "رياضه"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardStatus(h: "عيد الميلاد"),
              CardStatus(h: "حب"),
              CardStatus(h: "غناء"),
            ],
          ),
        ],
      ),
    );
  }
}
