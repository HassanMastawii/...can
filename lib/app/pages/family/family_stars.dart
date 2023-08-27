import 'package:canary_app/app/components/account_card.dart';
import 'package:flutter/material.dart';

import '../../components/friend_card.dart';

class FamilyStars extends StatelessWidget {
  const FamilyStars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نجوم العائلة"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: FriendCard(
            trailing: Text(
              "100k",
              style: TextStyle(
                backgroundColor: Colors.brown,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
