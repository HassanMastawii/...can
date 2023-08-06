import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.imageLink,
    this.onTap,
    required this.chatName,
    required this.chatCountry,
  });
  final String imageLink;
  final void Function()? onTap;
  final String chatName;
  final String chatCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            imageLink,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(chatName, style: TextStyle(fontSize: 16)),
                Text(chatCountry, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
