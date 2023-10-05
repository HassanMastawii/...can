import 'package:canary_app/app/components/image_picker_mobile.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/pages/MyRoom.dart/a3lanRoom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/bacpicroom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/states.dart';
import 'package:canary_app/app/pages/edit_page/edit_page.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_field.dart';
import 'package:canary_app/app/widgets/my_text_form_field.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'adminroom.dart';
import 'blokroom.dart';

class Editroom extends StatefulWidget {
  const Editroom({super.key, required this.room});
  final Room room;
  @override
  State<Editroom> createState() => _EditroomState();
}

class _EditroomState extends State<Editroom> {
  late final TextEditingController nameCntrlr;
  late final TextEditingController password;

  @override
  void initState() {
    nameCntrlr = TextEditingController(text: widget.room.name);
    password = TextEditingController();
    super.initState();
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
                      IconButton(
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
                                            final state = await context
                                                .read<RoomProvider>()
                                                .upRoomImg(image.text,
                                                    widget.room.roomId!);
                                            if (state is ErrorState) {
                                              MySnackBar.showMyToast(
                                                  text: state.failure.message);
                                            } else if (state is ResState) {
                                              setState(() {
                                                widget.room.pic = state.path;
                                              });
                                              MySnackBar.showDoneToast();
                                            }
                                          },
                                  )
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.more_vert_sharp)),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              builder: (context) => EditPage(
                                title: "أدخل اسم الرووم الجديد",
                                hint: "اسم الرووم",
                                oldVal: widget.room.name,
                                onSubmit: (p0) {},
                              ),
                            );
                          },
                          child: MyTextFormField(
                            enabled: false,
                            color: Colors.white.withOpacity(0.8),
                            labelText: "اسم الرووم",
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
                            useSafeArea: true,
                            isScrollControlled: true,
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
