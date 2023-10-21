import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/exstra.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/geft/geft.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/imoge/imoge.dart';
import 'package:canary_app/app/components/chat_input/chat_input_area.dart';
import 'package:canary_app/app/messages/list_chat_privt_inroom.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/messages/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MiniconRoom extends StatefulWidget {
  const MiniconRoom({super.key});

  @override
  State<MiniconRoom> createState() => _MiniconRoomState();
}

class _MiniconRoomState extends State<MiniconRoom> {
  bool isVolumeOn = true;
  bool ismic = true;

  void toggleVolume() {
    setState(() {
      isVolumeOn = !isVolumeOn;
    });
  }

  void micval() {
    setState(() {
      ismic = !ismic;
    });
  }

  bool isTextFeildShown = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (isTextFeildShown) {
            setState(() {
              isTextFeildShown = false;
            });
            return false;
          } else {
            context.read<RoomProvider>().addMessage(SystemMessage(
                  id: 1,
                  text:
                      "غادر ${context.read<CoreProvider>().myProfile?.name} الرووم",
                ));
            return true;
          }
        },
        child: Column(
          children: [
            if (!isTextFeildShown)
              Stack(alignment: Alignment.center, children: [
                SizedBox(
                  height: 84.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 33.h,
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.amberAccent, width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const SizedBox(child: Exstra());
                                      });
                                },
                                icon: const Icon(
                                  Icons.now_widgets_outlined,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: toggleVolume,
                                icon: Icon(
                                  isVolumeOn
                                      ? Icons.volume_up
                                      : Icons.volume_off,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: micval,
                                icon: Icon(
                                  ismic ? Icons.keyboard_voice : Icons.mic_off,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                            height: 350.h,
                                            child: const ImogeMic());
                                      });
                                },
                                icon: const Icon(
                                  Icons.mood,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const ListChat();
                                      });
                                },
                                icon: const Icon(
                                  Icons.mail,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isTextFeildShown = !isTextFeildShown;
                                  });
                                  // showModalBottomSheet(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return const ChatInRoom();
                                  //     });
                                },
                                //اريد هاذه تعمل سكرول ليبقى التكست فيلد والايقونات اللي جنبة ويضهر تحتهم الكيبورد
                                icon: const Icon(
                                  Icons.comment_outlined,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final Gift? gift = await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              height: 350.h, child: const Geftbox());
                        });
                    if (gift != null) {
                      print('${gift.name} ${gift.src}');
                    } else {}
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      width: 75.w,
                      height: 75.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/geftbox.png"))),
                    ),
                  ),
                ),
              ]),
            if (isTextFeildShown)
              ChatInputArea(
                onSendText: (p0) {
                  context.read<RoomProvider>().addMessage(TextMessage(
                        id: 1,
                        fromUser: context.read<CoreProvider>().myProfile?.name,
                        message: p0,
                      ));
                },
              ),
          ],
        ));
  }
}
