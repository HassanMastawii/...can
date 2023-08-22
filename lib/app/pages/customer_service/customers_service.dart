import 'package:canary_app/app/components/input_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/message_buble.dart';

class CustomersService extends StatefulWidget {
  const CustomersService({super.key});

  @override
  State<CustomersService> createState() => _CustomersServiceState();
}

class _CustomersServiceState extends State<CustomersService> {
  TextEditingController controller = TextEditingController();
  List<Message> msgs = [
    Message("الو", "انا", 1),
    Message("هلا", "فريق الدعم", 2),
  ];
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
                children: const [
                  Text(
                    "فريق الدعم",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  text: msgs.reversed.toList()[index].text,
                  username: msgs.reversed.toList()[index].username,
                  userId: msgs.reversed.toList()[index].userId,
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
                msgs.add(Message(controller.text, "انا", 1));
                controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final String username;
  final int userId;

  Message(this.text, this.username, this.userId);
}
