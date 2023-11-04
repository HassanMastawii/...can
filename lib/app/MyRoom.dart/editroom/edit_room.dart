import 'package:canary_app/app/MyRoom.dart/editroom/a3lan_in_room/a3lanRoom.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/admin/adminroom.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/backgraondroom/bacpicroom.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/block/blokroom.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/components_edatRoom/edit_page.dart';
import 'package:canary_app/app/MyRoom.dart/editroom/states/states.dart';
import 'package:canary_app/app/components/model_bottom_sheet/my_photo_picker.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_text_form_field.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editroom extends StatefulWidget {
  const Editroom({super.key, required this.room});
  final Room room;
  @override
  State<Editroom> createState() => _EditroomState();
}

class _EditroomState extends State<Editroom> {
  late final TextEditingController nameCntrlr;
  late final TextEditingController password;
  final MyPhotoPicker _myPhotoPicker = MyPhotoPicker();
  @override
  void dispose() {
    password.dispose();
    nameCntrlr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameCntrlr = TextEditingController(text: widget.room.name);
    password = TextEditingController();
    super.initState();
  }

  _changeImg() async {
    final state = await context
        .read<RoomProvider>()
        .upRoomImg(_myPhotoPicker.path!, widget.room.roomId!);
    if (state is ErrorState) {
      MySnackBar.showMyToast(text: state.failure.message);
    } else if (state is DataState<String>) {
      setState(() {
        widget.room.pic = state.data;
      });
      MySnackBar.showDoneToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "$serverLink${widget.room.pic!}",
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopupMenuButton(
                        child: CircleAvatar(
                          child: Visibility(
                            visible: !context.watch<RoomProvider>().isLoading,
                            replacement: const CircularProgressIndicator(),
                            child: const Icon(Icons.more_vert_outlined),
                          ),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: const Text("الاستديو"),
                            onTap: () async {
                              await _myPhotoPicker
                                  .fromGallery()
                                  .then((value) async {
                                if (value != null) {
                                  await _changeImg();
                                }
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: const Text("الكاميرا"),
                            onTap: () async {
                              await _myPhotoPicker
                                  .fromCamera()
                                  .then((value) async {
                                if (value != null) {
                                  await _changeImg();
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              // useSafeArea: true,
                              // isScrollControlled: true,
                              builder: (context) => EditPage(
                                title: "أدخل اسم الغرفة الجديد",
                                hint: "اسم الغرفة",
                                oldVal: widget.room.name,
                                onSubmit: (p0) {},
                              ),
                            );
                          },
                          child: MyTextFormField(
                            enabled: false,
                            color: Colors.white.withOpacity(0.8),
                            labelText: "اسم الغرفة",
                            textEditingController:
                                TextEditingController(text: widget.room.name),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Card(
              elevation: 11,
              child: SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            // useSafeArea: true,
                            // isScrollControlled: true,
                            builder: (context) => EditPage(
                              title: "أدخل قفل الغرفة الجديد",
                              hint: "قفل الغرفة",
                              oldVal: "",
                              secure: true,
                              onSubmit: (p0) {},
                            ),
                          );
                        },
                        child: MyTextFormField(
                          enabled: false,
                          labelText: "قفل الغرفة",
                          textEditingController:
                              TextEditingController(text: "********"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const States();
                              });
                        },
                        icon: const Icon(
                          Icons.note_alt,
                          size: 30,
                        )),
                    const Text(
                      "الحاله",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return const A3lanRoom();
                              });
                        },
                        icon: const Icon(
                          Icons.note_alt,
                          size: 30,
                        )),
                    const Text(
                      "اعلان الغرفه",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Bacpicroom(room: widget.room),
                              ));
                        },
                        icon: const Icon(
                          Icons.photo_library,
                          size: 30,
                        )),
                    const Text(
                      "اختيار خلفيه",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return const Adminroom();
                              });
                        },
                        icon: const Icon(
                          Icons.admin_panel_settings_outlined,
                          size: 30,
                        )),
                    const Text(
                      "ادارة المشرفين",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return const Blokroom();
                              });
                        },
                        icon: const Icon(
                          Icons.person_off_outlined,
                          size: 30,
                        )),
                    const Text(
                      "ادارة الطرد",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
