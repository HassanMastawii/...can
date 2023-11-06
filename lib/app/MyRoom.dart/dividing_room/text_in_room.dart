import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/super_chat/slidersuperchat.dart';
import 'package:canary_app/app/messages/message_buble.dart';
import 'package:canary_app/app/profail/profile_public/show_profail_frend.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/domain/models/messages/gift_message.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/messages/text_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextInRoom extends StatefulWidget {
  const TextInRoom({super.key});

  @override
  State<TextInRoom> createState() => _TextInRoomState();
}

class _TextInRoomState extends State<TextInRoom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Consumer<RoomProvider>(builder: (__, msgs, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: msgs.messages.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _messageBuilder(msgs.messages[index]),
                  ),
                );
              }),
            ),
            IconButton(
                onPressed: () {
                  // showGeneralDialog(
                  //   context: context,
                  //   pageBuilder: (BuildContext buildContext,
                  //       Animation<double> animation,
                  //       Animation<double> secondaryAnimation) {
                  //     // يمكنك بناء وتخصيص محتوى حوارك هنا
                  //     return Center(
                  //       child: Container(
                  //         width: 300.0,
                  //         height: 500.0,
                  //         color: Colors.transparent,
                  //         child: const RouletteGame(),
                  //       ),
                  //     );
                  //   },
                  // );
                },
                icon: const Icon(
                  Icons.https_rounded,
                  color: Colors.deepOrange,
                  size: 44,
                )),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amberAccent, width: 2),
            ),
            child: const SliderSuperchat(),
          ),
        ),
      ],
    );
  }

  Widget listTileBuilder(TextMessage message) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return const ShowProfailFrendInRoom();
            });
      },
      title: Text(
        message.fromUser ?? "",
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        message.message,
        style: const TextStyle(color: Colors.white),
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 30,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage("images/pic_room.jpg"),
        ),
      ),
    );
  }

  Widget _messageBuilder(Message message) {
    switch (message.type) {
      case "1":
        message as TextMessage;
        return listTileBuilder(message);
      case "4":
        message as GiftMessage;
        return GiftBubble(giftMessage: message);
      case "5":
        message as SystemMessage;
        return SystemBubble(systemMessage: message);
      default:
        return const SizedBox();
    }
  }
}
