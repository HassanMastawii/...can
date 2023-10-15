// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_element

import 'dart:async';

import 'package:canary_app/app/messages/home_message.dart';
import 'package:canary_app/app/messages/private_chat/masseg_prifet.dart';
import 'package:flutter/material.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  Widget build(BuildContext context) {
    bool _newmasseg = true;

    @override
    void initState() {
      super.initState();

      Timer.periodic(Duration(milliseconds: 500), (timer) {
        setState(() {
          _newmasseg = !_newmasseg;
        });
      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "الرسائل",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Divider(color: Colors.black12),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 56,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: MyHomeMessage(
                      name: "عادل الدرة",
                      message: "السلام عليكم كيفك كابتن",
                      time: "12:23 pm",
                      pictureLink: "images/pic_room.jpg",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MassegPraifet(),
                        ));
                      },
                    ),
                  ),
                  if (_newmasseg)
                    Positioned(
                      top: 5.0,
                      right: 5.0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
