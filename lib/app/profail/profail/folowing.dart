import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/friend_card.dart';

class FolowingPage extends StatefulWidget {
  const FolowingPage({super.key});

  @override
  State<FolowingPage> createState() => _FolowingPageState();
}

class _FolowingPageState extends State<FolowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "اتابعهم",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
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
                          text: " حظر",
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
