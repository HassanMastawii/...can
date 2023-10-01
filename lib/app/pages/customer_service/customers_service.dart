import 'package:canary_app/app/components/input_area.dart';
import 'package:canary_app/domain/models/message.dart';
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
  List<Message> msgs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
