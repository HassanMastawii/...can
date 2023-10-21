import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:canary_app/domain/models/messages/gift_message.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/messages/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MessageBuble extends StatelessWidget {
  const MessageBuble({
    super.key,
    required this.textMessage,
  });
  final TextMessage textMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/pic_room.jpg"),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )),
          width: 220.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textMessage.fromUser ?? "",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 142, 219, 229), fontSize: 14),
                ),
                Text(
                  textMessage.message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GiftBubble extends StatelessWidget {
  const GiftBubble({super.key, required this.giftMessage});
  final GiftMessage giftMessage;
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Text(
                giftMessage.text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              10.getWidthSizedBox(),
              if (giftMessage.gift != null)
                SizedBox(
                  height: 50,
                  width: 50,
                  child:
                      SvgPicture.network("$serverLink${giftMessage.gift!.pic}"),
                ),
            ],
          ),
        ),
      );
}

class SystemBubble extends StatelessWidget {
  const SystemBubble({super.key, required this.systemMessage});
  final SystemMessage systemMessage;
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            systemMessage.text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );
}
