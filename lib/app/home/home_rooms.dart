import 'package:canary_app/app/MyRoom.dart/my_room.dart';
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
import 'package:canary_app/app/widgets/skeleton.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class HomeRooms extends StatefulWidget {
  const HomeRooms({super.key});

  @override
  State<HomeRooms> createState() => _HomeRoomsState();
}

class _HomeRoomsState extends State<HomeRooms> {
  List<Room>? roomData;
  bool isLoading = true;

  ///تابع لجلب الروومات الموجودة في السيرفر
  Future<void> fetchData() async {
    isLoading = true;
    setState(() {});
    final state = await context.read<RoomProvider>().searchRoom("");
    if (state is DataState<List<Room>>) {
      //عند نجاح العملية نعرض الروومات المتاحة
      setState(() {
        isLoading = false;
        roomData = state.data;
      });
    } else if (state is ErrorState) {
      //عند فشل العملية نعرض رسالة خطأ
      setState(() {
        isLoading = false;
      });
      MySnackBar.showMyToast(text: state.failure.message);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchData();
    });
    super.initState();
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
                    showDialog(
                      context: context,
                      builder: (context) => const CreateRoomDialog(),
                    );
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
                            itemCount: roomData!.length,
                            itemBuilder: (context, index) {
                              return RoomCard(
                                roomstatus: roomData?[index].roomStatus ?? "",
                                chatCountry: roomData?[index].contry ?? "",
                                chatName: roomData?[index].name ?? "",
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyRoom(
                                      room: roomData![index],
                                      userList: const [],
                                    ),
                                  ));
                                },
                                imageLink: roomData?[index].pic ?? "",
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
}
