import 'package:canary_app/app/components/input_area.dart';
import 'package:canary_app/app/messages/message_buble.dart';
import 'package:canary_app/domain/models/messages/gift_message.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/messages/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MassegPraifet extends StatefulWidget {
  const MassegPraifet({super.key});

  @override
  State<MassegPraifet> createState() => _MassegPraifetState();
}

class _MassegPraifetState extends State<MassegPraifet> {
  TextEditingController controller = TextEditingController();
  List<Message> msgs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "user name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 24.h,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.library_add_rounded,
                              size: 15,
                            )),
                        const Text(
                          "ID: ",
                        ),
                        const Text(
                          "1234567890",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: Container(
                  width: 55.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("images/pic_room.jpg")),
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _messageBuilder(msgs[index]),
              ),
              reverse: true,
              itemCount: msgs.length,
            ),
          ),
          InputArea(
            controller: controller,
            onSend: () {},
          ),
        ],
      ),
    );
  }

  static Widget _messageBuilder(Message message) {
    switch (message.type) {
      case "1":
        message as TextMessage;
        return MessageBuble(textMessage: message);
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
