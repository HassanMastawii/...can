import 'package:canary_app/app/pages/MyRoom.dart/a3lanRoom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/bacpicroom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/states.dart';
import 'package:flutter/material.dart';
import 'adminroom.dart';
import 'blokroom.dart';

class Editroom extends StatefulWidget {
  const Editroom({super.key});

  @override
  State<Editroom> createState() => _EditroomState();
}

class _EditroomState extends State<Editroom> {
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/pic_room.jpg"))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: IconButton(
                            color: Colors.black,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings_applications_rounded,
                              size: 50,
                            )),
                      ),
                      Container(
                        height: 60,
                        width: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(33)),
                            color: Colors.black38),
                        child: const TextField(
                          decoration: InputDecoration(
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(33))),
                              hintText: "اسم الغرف",
                              hintTextDirection: TextDirection.ltr,
                              fillColor: Colors.amber,
                              focusColor: Colors.amber,
                              helperStyle:
                                  TextStyle(color: Colors.white, fontSize: 22),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 22),
                              hoverColor: Colors.blueGrey,
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 22)),
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
                    Container(
                      height: 60,
                      width: 280,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(33)),
                          color: Colors.black38),
                      child: const TextField(
                        decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33))),
                            hintText: "قفل الغرفه",
                            hintTextDirection: TextDirection.ltr,
                            fillColor: Colors.amber,
                            focusColor: Colors.amber,
                            helperStyle:
                                TextStyle(color: Colors.white, fontSize: 22),
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 22),
                            hoverColor: Colors.blueGrey,
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 22)),
                      ),
                    ),
                    const Text(
                      "قفل الغرفه",
                      style: TextStyle(color: Colors.black, fontSize: 18),
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
                                builder: (context) => const Bacpicroom(),
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
