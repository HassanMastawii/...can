import 'package:canary_app/app/components/list_chat_privt_inroom.dart';
import 'package:canary_app/app/components/model_bottom_sheet/chatInRoom.dart';
import 'package:canary_app/app/pages/Home/home_chat.dart';
import 'package:canary_app/app/pages/MyRoom.dart/edit_room.dart';
import 'package:canary_app/min_baer/exstra/exstra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/model_bottom_sheet/geft.dart';
import '../../components/model_bottom_sheet/imoge.dart';
import '../profile/show_profail_frend.dart';
import 'peopleinroom.dart';
import 'praicroom.dart';

class MyRoom extends StatefulWidget {
  const MyRoom({super.key});

  @override
  State<MyRoom> createState() => _MyRoomState();
}

class _MyRoomState extends State<MyRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black38,
        title: ListTile(
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
                backgroundImage: const AssetImage("images/pic_room.jpg"),
              ),
            ),
          ),
          subtitle: const Text("ID:5231564"),
          title: const Text("كناري شات"),
        ),
        actions: [
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.power_settings_new,
          ),
        ),
      ),
      body: Container(
        color: Colors.black38,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                TextButton.icon(
                    style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.yellow),
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
                    label: const Text("1000")),
              ],
            ),
            Wrap(
              children: [
                getMember(),
                getMember(),
                getMember(),
                getMember(),
                getMember(),
                getMember(),
                getMember(),
                getMember(),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
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
                    title: const Text("محمد علي كلاي"),
                    subtitle: const Text("رسالة جديدة"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/pic_room.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(alignment: Alignment.topCenter, children: [
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: Container(
                  width: double.infinity,
                  height: 84.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        height: 55.h,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.amberAccent, width: 2)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(context: context,
                                  builder: (context){
                                    return const Exstra();
                                  }
                                  );
                                },
                                icon: const Icon(
                                  Icons.now_widgets_outlined,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  color: Colors.amber,
                                  Icons.volume_up,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings_voice,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                            const Spacer(
                              flex: 2,
                            ),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(66)),
                                            height: 280.h,
                                            width: double.infinity,
                                            child: const ImogeMic());
                                      });
                                },
                                icon: const Icon(
                                  Icons.mood,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            child: const ListChat());
                                      });
                                },
                                icon: const Icon(
                                  Icons.mail,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 80.h,
                                            child: const ChatInRoom());
                                      });
                                },
                                icon: const Icon(
                                  Icons.comment_outlined,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(66)),
                            height: 280.h,
                            width: double.infinity,
                            child: const Geftbox());
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Container(
                    width: 85.w,
                    height: 85.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/geftbox.png"))),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  getMember({double rbig = 35, double rsmall = 33}) {
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
          const Text("ali"),
        ],
      ),
    );
  }
}
