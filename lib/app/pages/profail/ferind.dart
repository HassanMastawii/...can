import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/friend_card.dart';
import '../../widgets/my_button.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 30,
                        )),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الأصدقاء", style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ],
                ),
              ),
              const CupertinoSearchTextField(
                  placeholder: "البحث عن اسم المستخدم"),
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
