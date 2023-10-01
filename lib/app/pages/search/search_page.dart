import 'package:canary_app/app/components/image_picker_mobile.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/pages/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/widgets/my_animated_button.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/profile.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Room> rooms = [];
  List<Profile> users = [];
  int _index = 0;
  final TextEditingController _controller = TextEditingController();
  searchRoom(String text) async {
    final state = await context.read<RoomProvider>().searchRoom(text);
    if (state is RoomsState) {
      setState(() {
        rooms = state.rooms;
      });
    } else if (state is ErrorState) {
      MySnackBar.showMyToast(text: state.failure.message);
    }
  }

  searchUser(String text) async {
    // final state = await context.read<RoomProvider>().searchRoom(text);
    // if (state is RoomsState) {
    //   setState(() {
    //     rooms = state.rooms;
    //   });
    // } else if (state is ErrorState) {
    MySnackBar.showMyToast(text: "sooooon");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _controller,
          placeholder: _index == 0
              ? "أكتب اسم الغرفة أو المعرف أو البلد"
              : "أكتب اسم الشخص أو المعرف أو البلد",
          onSubmitted: (value) async {
            if (_index == 0) {
              await searchRoom(value);
            } else {
              await searchUser(value);
            }
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyAnimatedButton(
                  isPressed: _index == 0,
                  text: "غرف",
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: MyAnimatedButton(
                  isPressed: _index == 1,
                  text: "أشخاص",
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                ),
              ),
            ],
          ),
          Visibility(
            visible: !context.watch<RoomProvider>().isLoading,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Expanded(
              child: _index == 0
                  ? ListView.builder(
                      itemCount: rooms.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(rooms[index].name ?? ""),
                        subtitle: Text(rooms[index].contry ?? ""),
                        trailing: IconButton(
                            onPressed: () {
                              TextEditingController image =
                                  TextEditingController();
                              showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                builder: (context) => ListView(
                                  children: [
                                    ImagePickerMobile(
                                      imageController: image,
                                      radius: 25,
                                    ),
                                    MyButton(
                                      text: "تعديل",
                                      color: Colors.blue,
                                      fontColor: Colors.white,
                                      onPressed: context
                                              .watch<RoomProvider>()
                                              .isLoading
                                          ? null
                                          : () async {
                                              print(image.text);
                                              final state = await context
                                                  .read<RoomProvider>()
                                                  .upRoomImg(image.text);
                                              if (state is ErrorState) {
                                                print(state.failure.message);

                                                MySnackBar.showMyToast(
                                                    text:
                                                        state.failure.message);
                                              } else if (state is ResState) {
                                                MySnackBar.showMyToast(
                                                    text: state.path);
                                              }
                                            },
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.more_vert_sharp)),
                        leading:
                            Image.network("$serverLink${rooms[index].pic}"),
                        onTap: () {
                          MyRouter.myPush(
                              context,
                              MyRoom(
                                room: rooms[index],
                              ));
                        },
                      ),
                    )
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(users[index].name ?? ""),
                        subtitle: Text(users[index].contry ?? ""),
                        leading:
                            Image.network("$serverLink${users[index].pic}"),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
