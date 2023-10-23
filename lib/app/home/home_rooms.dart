import 'package:canary_app/app/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/home/bnart.dart';
import 'package:canary_app/app/home/card_superchat.dart';
import 'package:canary_app/app/home/my_visits.dart';
import 'package:canary_app/app/home/room_card.dart';
import 'package:canary_app/app/home/search_page.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';

import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeRooms extends StatefulWidget {
  const HomeRooms({super.key});

  @override
  State<HomeRooms> createState() => _HomeRoomsState();
}

class _HomeRoomsState extends State<HomeRooms> {
  List<Room> roomData = [];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchData();
    }); // استدعاء الداتا من ال api
  }

  Future<void> fetchData() async {
    final state = await context.read<RoomProvider>().searchRoom("");
    if (state is ListState<Room>) {
      setState(() {
        roomData = state.list;
      });
    } else if (state is ErrorState) {
      MySnackBar.showMyToast(text: state.failure.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: ImageSlideshow(
                height: 80,
                disableUserScrolling: false,
                autoPlayInterval: 3000,
                isLoop: true,
                indicatorRadius: 4,
                children: [
                  Baner(),
                  Baner(),
                  Baner(),
                  Baner(),
                ],
              )),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: ImageSlideshow(
                height: 80,
                disableUserScrolling: false,
                autoPlayInterval: 9000,
                isLoop: true,
                indicatorRadius: 4,
                children: [
                  SuperChat(),
                  SuperChat(),
                  SuperChat(),
                  SuperChat(),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    MyRouter.myPush(context, const SearchPage());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyRoom(
                            userList: [],
                          ),
                        ));
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                  iconSize: 30,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'رائج',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Myvisits(),
                    ));
                  },
                  child: const Text(
                    'زياراتي',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GridView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: roomData.length,
                  itemBuilder: (context, index) {
                    return RoomCard(
                      roomstatus: roomData[index].roomStatus ?? "",
                      chatCountry: roomData[index].contry ?? "",
                      chatName: roomData[index].name ?? "",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyRoom(
                            userList: [],
                            room: roomData[index],
                          ),
                        ));
                      },
                      imageLink: roomData[index].pic ?? "",
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
