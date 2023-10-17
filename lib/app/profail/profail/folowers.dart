import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/friend_card.dart';

class FolowerPage extends StatefulWidget {
  const FolowerPage({super.key});

  @override
  State<FolowerPage> createState() => _FolowerPageState();
}

class _FolowerPageState extends State<FolowerPage> {
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
                child: Text(
                  "المتابعين",
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
                          text: "حظر",
                          color: Colors.red,
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
