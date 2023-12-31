import 'dart:developer';

import 'package:canary_app/app/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/components/dialogs/create_room_dialog.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/home/bnart.dart';
import 'package:canary_app/app/home/card_superchat.dart';
import 'package:canary_app/app/home/my_visits.dart';
import 'package:canary_app/app/home/room_card.dart';
import 'package:canary_app/app/home/search_page.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/socket/link_socket.dart';
import 'package:canary_app/app/widgets/skeleton.dart';
import 'package:canary_app/domain/extensions/country_code.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeRooms extends StatefulWidget {
  const HomeRooms({super.key});

  @override
  State<HomeRooms> createState() => _HomeRoomsState();
}

class _HomeRoomsState extends State<HomeRooms> {
  List<Room>? roomData;
  bool isLoading = true;
  IO.Socket? socket;
  List<String> roomFlags = [];
  List<Room> roomFiltered = [];
  List<Room> sample = [
    Room(contry: "af", name: "maher1"),
    Room(contry: "sy", name: "maher2"),
    Room(contry: "af", name: "maher3"),
    Room(contry: "af", name: "maher4"),
  ];

  ///تابع لجلب الروومات الموجودة في السيرفر
  Future<void> fetchData() async {
    isLoading = true;
    setState(() {});
    final state = await context.read<RoomProvider>().searchRoom("");
    if (state is DataState<List<Room>>) {
      //عند نجاح العملية نعرض الروومات المتاحة
      isLoading = false;
      roomData = state.data;
      roomFiltered = state.data;
      for (var element in state.data) {
        if (!roomFlags.contains(element.contry)) {
          roomFlags.add(element.contry!);
        }
      }
      setState(() {});
    } else if (state is ErrorState) {
      //عند فشل العملية نعرض رسالة خطأ
      isLoading = false;
      // roomData = sample;
      // roomFiltered = sample;
      // for (var element in sample) {
      //   if (!roomFlags.contains(element.contry)) {
      //     roomFlags.add(element.contry!);
      //   }
      // }
      setState(() {});
      log(state.failure.message);
      MySnackBar.showMyToast(text: state.failure.message);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await fetchData();
      // initializeSocket();
    });
    super.initState();
  }

  // void initializeSocket() {
  //   SocketLink();
  //   // Start socket connection;
  //   socket!.connect();
  //   socket!.on('chat message', (data) {
  //     print('Message from server: $data');

  //     // setState(() {
  //     //   fetchData();
  //     // });
  //   });
  //   socket!.emit('chat message', 'create room');
  // }

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
                    if (context.read<RoomProvider>().myRoom != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyRoom(
                          room: context.read<RoomProvider>().myRoom,
                          userList: const [],
                        ),
                      ));
                    } else if (!context
                        .read<RoomProvider>()
                        .isLoadingRoomInfo) {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateRoomDialog(),
                      );
                    }
                  },
                  icon: Icon(
                    context.watch<RoomProvider>().myRoom != null
                        ? Icons.home
                        : Icons.add,
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
          FormBuilderFilterChip(
            name: "country",
            runSpacing: 5,
            spacing: 5,
            direction: Axis.horizontal,
            onChanged: (value) {
              if (value!.isEmpty) {
                roomFiltered = roomData!;
                log(roomFiltered.toString());
                setState(() {});
              } else {
                log(value.toString());
                roomFiltered = [];
                for (var e in roomData!) {
                  if (value.contains(e.contry)) {
                    log(e.contry!);
                    roomFiltered.add(e);
                  }
                }
                setState(() {});
              }
            },
            disabledColor: chipColor,
            backgroundColor: chipColor,
            labelStyle: const TextStyle(color: Colors.white),
            options: roomFlags.map(
              (e) {
                return FormBuilderChipOption(value: e, avatar: CircleFlag(e));
              },
            ).toList(),
          ),
          Expanded(
            child: Stack(
              children: [
                roomData == null && isLoading
                    ? getLoader()
                    : roomData == null
                        ? getError()
                        : GridView.builder(
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                            ),
                            itemCount: roomFiltered.length,
                            itemBuilder: (context, index) {
                              // if (index % 2 == 0) {
                              //   return Text("hello");
                              // }
                              return RoomCard(
                                roomstatus:
                                    roomFiltered[index].roomStatus ?? "",
                                chatCountry: roomFiltered[index].contry ?? "",
                                chatName: roomFiltered[index].name ?? "",
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyRoom(
                                      room: roomFiltered[index],
                                      userList: const [],
                                    ),
                                  ));
                                },
                                imageLink: roomFiltered[index].pic ?? "",
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

  getLoader() {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        Skeleton(),
        Skeleton(),
        Skeleton(),
        Skeleton(),
        Skeleton(),
        Skeleton(),
        Skeleton(),
        Skeleton(),
      ],
    );
  }

  getError() {
    return Column(
      children: [
        100.getHightSizedBox(),
        TextButton(
          onPressed: () {
            setState(() {
              fetchData();
            });
          },
          child: Text(
            "إعادة المحاولة",
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // قطع الاتصال عند إغلاق التطبيق
    socket?.disconnect();
    super.dispose();
  }
}
