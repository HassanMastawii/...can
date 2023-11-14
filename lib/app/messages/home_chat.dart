import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/components/friend_card.dart';
import 'package:canary_app/app/messages/home_message.dart';
import 'package:canary_app/app/messages/private_chat/masseg_prifet.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الرسائل"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'الرسائل'),
              Tab(text: 'الأصدقاء'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildMessagesScreen(context),
            buildFriendsScreen(),
          ],
        ),
      ),
    );
  }

  Widget buildMessagesScreen(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: MyButton(
              color: praimerycalor,
              fontColor: Colors.black,
              onPressed: () {},
              text: 'خدمة العملاء',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: MyButton(
              color: praimerycalor,
              fontColor: Colors.black,
              onPressed: () {},
              text: 'إشعارات النظام',
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
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 56,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyHomeMessage(
                    name: 'عادل الدرة',
                    message: 'السلام عليكم كيفك كابتن',
                    time: '12:23 pm',
                    pictureLink: 'images/pic_room.jpg',
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

  Widget buildFriendsScreen() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 56,
        itemBuilder: (context, index) {
          return const FriendCard(
            trailing: Column(children: [
              MyButton(
                text: "حظر",
                color: Colors.red,
                size: 14,
                fontColor: Colors.white,
              ),
              MyButton(
                text: "إلغاء",
                color: Colors.grey,
                size: 14,
                fontColor: Colors.white,
              ),
            ]),
          );
        },
      ),
    ));
  }
}
