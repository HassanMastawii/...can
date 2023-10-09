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
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            imageLink,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(chatName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                  Text(chatCountry,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
