import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/friend_card.dart';

class VisitorsPage extends StatefulWidget {
  const VisitorsPage({super.key});

  @override
  State<VisitorsPage> createState() => _VisitorsPageState();
}

class _VisitorsPageState extends State<VisitorsPage> {
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
                  "الزوار",
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
                      trailing: Tooltip(
                          message: "2023-09-05 09:05 pm",
                          child: Text("09:05 pm")),
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
