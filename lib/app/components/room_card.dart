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
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(chatName,
                          style: const TextStyle(
                           color: Colors.white
                          )),
                    )),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(chatCountry,
                          style: const TextStyle(
                           color: Colors.white
                          )),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
