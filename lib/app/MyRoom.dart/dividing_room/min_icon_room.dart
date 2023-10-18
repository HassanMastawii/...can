import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/exstra.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/geft/geft.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/imoge/imoge.dart';
import 'package:canary_app/app/components/input_area.dart';
import 'package:canary_app/app/messages/list_chat_privt_inroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  final TextEditingController _controller = TextEditingController();
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
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              height: 350.h, child: const Geftbox());
                        });
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
            if (isTextFeildShown) InputArea(controller: _controller),
          ],
        ));
  }
}
