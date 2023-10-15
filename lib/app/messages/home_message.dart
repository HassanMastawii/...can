import 'package:flutter/material.dart';

class MyHomeMessage extends StatelessWidget {
  const MyHomeMessage({
    Key? key,
    required this.name,
    required this.message,
    this.onPressed,
    required this.time,
    required this.pictureLink,
    this.isUnread = false,
  }) : super(key: key);

  final String name;
  final String time;
  final String message;
  final String pictureLink;
  final bool isUnread;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          title: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(pictureLink),
              ),
              if (isUnread)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
          trailing: Text(time),
        ),
        const Divider(indent: 70, color: Colors.black),
      ],
    );
  }
}
