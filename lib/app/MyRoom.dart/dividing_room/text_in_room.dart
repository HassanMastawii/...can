import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/super_chat/slidersuperchat.dart';
import 'package:canary_app/app/profail/profile_public/show_profail_frend.dart';
import 'package:flutter/material.dart';

class TextInRoom extends StatefulWidget {
  const TextInRoom({super.key});

  @override
  State<TextInRoom> createState() => _TextInRoomState();
}

class _TextInRoomState extends State<TextInRoom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ShowProfailFrendInRoom();
                            });
                      },
                      title: const Text(
                        "محمد علي كلاي",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(
                        "رسالة جديدة",
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 30,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage("images/pic_room.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => RouletteGame(),
                    //     ));
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
      ),
    );
  }
}
