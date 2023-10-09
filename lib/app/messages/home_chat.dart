import 'package:canary_app/app/messages/home_message.dart';
import 'package:canary_app/app/messages/private_chat/masseg_prifet.dart';

import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class HomeChat extends StatefulWidget {
  const HomeChat({super.key});

  @override
  State<HomeChat> createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.cyan[200],
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    onPressed: () {},
                    text: "الأصدقاء",
                  ),
                  MyButton(
                    onPressed: () {},
                    text: "الرسائل",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: MyButton(
                  onPressed: () {},
                  text: "خدمة العملاء",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: MyButton(
                  onPressed: () {},
                  text: "إشعارات النظام",
                ),
              ),
            ),
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
        ),
      ),
    );
  }
}
