import 'package:flutter/material.dart';

class Mic extends StatefulWidget {
  const Mic({
    super.key,
    this.isSelected = false,
    this.onTap,
  });
  final bool isSelected;
  final void Function()? onTap;

  @override
  State<Mic> createState() => _MicState();
}

class _MicState extends State<Mic> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                  child: CircleAvatar(
                    radius: widget.isSelected ? 25 : 29,
                    backgroundImage: const AssetImage("images/pic_room.jpg"),
                  ),
                ),
                if (widget.isSelected)
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 10,
                    child: Icon(
                      Icons.done,
                      size: 10,
                    ),
                  ),
              ],
            ),
            const Text(
              "mic",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
