import 'package:canary_app/app/MyRoom.dart/dividing_room/mic_in_Room.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/min_icon_room.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/onar_micRoom.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/text_in_room.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/edit_room.dart';

import 'package:canary_app/app/MyRoom.dart/peopleroom/peopleinroom.dart';

import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/models/user_coin.dart';

import 'package:flutter/material.dart';

class MyRoom extends StatefulWidget {
  const MyRoom({
    super.key,
    this.room,
    required this.userList,
  });
  final Room? room;
  final List<UserCoin> userList;

  @override
  State<MyRoom> createState() => _MyRoomState();
}

class _MyRoomState extends State<MyRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amberAccent, width: 2),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await MyRouter.myPush(
                                context,
                                Editroom(room: widget.room!),
                              ).then((value) {
                                setState(() {
                                  print("done");
                                });
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "$serverLink${widget.room?.pic}"),
                                        fit: BoxFit.cover, // Adjust as needed
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Add spacing between image and text
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        widget.room?.name ?? "",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "ID: ${widget.room?.roomId}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const PeopleinRoom(
                                  userList: [],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          label: Text(
                            "${widget.userList.length}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OnarMicRoom(),
                  const MicatinRoom(),
                  const TextInRoom(),
                  const MiniconRoom(),
                ],
              ),
            ),
          ),
        ],
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
