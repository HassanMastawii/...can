// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:canary_app/app/MyRoom.dart/my_room.dart';
import 'package:canary_app/app/components/toast.dart';

import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/widgets/my_animated_button.dart';
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
    if (state is ListState<Room>) {
      setState(() {
        rooms = state.list;
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        leading:
                            Image.network("$serverLink${rooms[index].pic}"),
                        onTap: () {
                          MyRouter.myPush(
                              context,
                              MyRoom(
                                room: rooms[index],
                                userList: [],
                              )).then((value) {
                            setState(() {});
                          });
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
