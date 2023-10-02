import 'package:canary_app/app/pages/profile_public/show_profail_frend.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/games/Roulette/Roulette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/input_area.dart';
import '../../components/model_bottom_sheet/exstra.dart';
import '../../components/model_bottom_sheet/geft.dart';
import '../../components/model_bottom_sheet/imoge.dart';
import '../../components/model_bottom_sheet/list_chat_privt_inroom.dart';

import 'edit_room.dart';
import 'peopleinroom.dart';
import 'praicroom.dart';
import 'mic.dart';

class MyRoom extends StatefulWidget {
  const MyRoom({super.key, this.room});
  final Room? room;

  @override
  State<MyRoom> createState() => _MyRoomState();
}

class _MyRoomState extends State<MyRoom> {
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
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: OverflowBox(
                maxHeight: MediaQuery.of(context).size.height,
                alignment: Alignment.topLeft,
                child: widget.room?.background == null
                    ? Image.asset(
                        'images/create_family_background.png',
                        repeat: ImageRepeat.repeat,
                        alignment: Alignment.topLeft,
                      )
                    : Image.network(
                        "$serverLink${widget.room!.background}",
                        repeat: ImageRepeat.repeat,
                        alignment: Alignment.topLeft,
                      ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Editroom(),
                                    ));
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 25,
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      AssetImage("images/pic_room.jpg"),
                                ),
                              ),
                            ),
                            subtitle: const Text(
                              "ID:5231564",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            title: const Text(
                              "كناري شات",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        TextButton.icon(
                            style: const ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide())),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const PeopleinRoom();
                                  });
                            },
                            icon: const Icon(Icons.group),
                            label: const Text("1000")),
                      ],
                    ),
                    Stack(
                      children: [
                        TextButton.icon(
                            style: const ButtonStyle(
                              iconColor:
                                  MaterialStatePropertyAll(Colors.yellow),
                              side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.amber),
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const Praicroom();
                                  });
                            },
                            icon: const Icon(Icons.attach_money_rounded),
                            label: const Text(
                              "1000",
                              style: TextStyle(color: Colors.yellow),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getMember(),
                            //لم اعرف ان اثبت صورة المستخدم الاساسيه في المنتصف اريد حل لهاذه
                            //done
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Mic(),
                          Mic(),
                          Mic(),
                          Mic(),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Mic(),
                          Mic(),
                          Mic(),
                          Mic(),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 240,
                      child: Row(
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
                                      backgroundImage:
                                          AssetImage("images/pic_room.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RouletteGame(),
                                    ));
                              },
                              icon: Icon(
                                Icons.https_rounded,
                                color: Colors.deepOrange,
                                size: 44,
                              )),
                        ],
                      ),
                    ),
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
                                                return const SizedBox(
                                                    child: Exstra());
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
                                          ismic
                                              ? Icons.keyboard_voice
                                              : Icons.mic_off,
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
                                            isTextFeildShown =
                                                !isTextFeildShown;
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMember({double rbig = 35, double rsmall = 33}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: rbig,
            child: CircleAvatar(
              radius: rsmall,
              backgroundImage: const AssetImage("images/pic_room.jpg"),
            ),
          ),
          const Text(
            "ali",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
