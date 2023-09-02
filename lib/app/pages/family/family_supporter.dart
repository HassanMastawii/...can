import 'package:flutter/material.dart';
import '../../components/friend_card.dart';

class FamilySupporter extends StatelessWidget {
  const FamilySupporter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("داعمو العائلة"),
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
