import 'package:canary_app/app/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/home/bnart.dart';
import 'package:canary_app/app/home/card_superchat.dart';
import 'package:canary_app/app/home/my_visits.dart';
import 'package:canary_app/app/home/room_card.dart';
import 'package:canary_app/app/home/search_page.dart';

import 'package:canary_app/app/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeRooms extends StatefulWidget {
  const HomeRooms({super.key});

  @override
  State<HomeRooms> createState() => _HomeRoomsState();
}

class _HomeRoomsState extends State<HomeRooms> {
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
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: 56,
              itemBuilder: (context, index) {
                return RoomCard(
                  chatCountry: "سوريا",
                  chatName: "شات العرب",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyRoom(
                        userList: [],
                      ),
                    ));
                  },
                  imageLink: "images/2.png",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
