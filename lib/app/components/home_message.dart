import 'package:flutter/material.dart';

class MyHomeMessage extends StatelessWidget {
  const MyHomeMessage({
    super.key,
    required this.name,
    required this.message,
    this.onPressed,
    required this.time,
    required this.pictureLink,
  });
  final String name;
  final String time;
  final String message;
  final String pictureLink;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: ListTile(
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
        leading: CircleAvatar(
          backgroundImage: AssetImage(pictureLink),
        ),
        trailing: Text(time),
      ),
    );
  }
}
