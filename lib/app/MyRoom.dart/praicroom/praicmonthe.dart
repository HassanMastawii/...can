import 'package:canary_app/app/MyRoom.dart/praicroom/cart_users.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';

class Praicmonthe extends StatelessWidget {
  const Praicmonthe({super.key, required this.userList});
  final List<UserCoin> userList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return Carduserspricinroom(
                user: userList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
