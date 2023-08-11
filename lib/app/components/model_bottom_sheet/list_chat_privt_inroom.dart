

import 'package:canary_app/app/components/home_message.dart';
import 'package:canary_app/app/pages/private_chat/masseg_prifet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        SizedBox(height: 11.h,),
        Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(33),
                        topRight: Radius.circular(33),
                      ),
                      // color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 56,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
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
                        );
                      },
                    ),
                  ),
                ),
      ],
    );
  }
}