import 'package:canary_app/app/components/input_area.dart';
import 'package:canary_app/app/messages/message_buble.dart';
import 'package:canary_app/domain/models/message.dart';
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
                child: MessageBuble(
                  text: msgs.reversed.toList()[index].message ?? "",
                  username: msgs.reversed.toList()[index].fromUser ?? "",
                  userId: msgs.reversed.toList()[index].id ?? 0,
                ),
              ),
              reverse: true,
              itemCount: msgs.length,
            ),
          ),
          InputArea(
            controller: controller,
            onSend: () {
              setState(() {
                msgs.add(
                  Message(
                    message: controller.text,
                    fromUser: "انا",
                    id: 1,
                  ),
                );
                controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}
