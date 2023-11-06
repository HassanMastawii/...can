import 'package:canary_app/app/MyRoom.dart/dividing_room/mic_in_Room.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/min_icon_room.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/onar_micRoom.dart';
import 'package:canary_app/app/MyRoom.dart/dividing_room/text_in_room.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/edit_room.dart';
import 'package:canary_app/app/MyRoom.dart/peopleroom/peopleinroom.dart';
import 'package:canary_app/app/canary_app.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/provider/providers/gifts_overlay_provider.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
  void initState() {
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('$serverLink/img/last/gift/Aircraft_7000.webm'))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(checkVideo);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RoomProvider>().addMessage(SystemMessage(
            id: 1,
            text: "أنضم ${context.read<CoreProvider>().myProfile?.name} للرووم",
          ));
    });
    super.initState();
  }

  void playGift(Gift gift) {
    context.read<GiftOverlayProvider>().show(
          context,
          gift,
          context.read<CoreProvider>().myProfile!.name!,
          "بو حيدرة",
        );
    _controller =
        VideoPlayerController.networkUrl(Uri.parse('$serverLink${gift.src}'))
          ..initialize().then((_) {
            setState(() {
              isPlaying = true;
            });
            _controller.addListener(checkVideo);
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void checkVideo() {
    if (_controller?.value.position == _controller?.value.duration) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  bool isPlaying = false;
  late VideoPlayerController _controller;

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
                  const OnarMicRoom(),
                  const MicatinRoom(),
                  Expanded(
                    child: Stack(
                      children: [
                        const TextInRoom(),
                        if (isPlaying)
                          SizedBox(
                            child: VideoPlayer(_controller),
                          ),
                      ],
                    ),
                  ),
                  MiniconRoom(onGift: playGift),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
