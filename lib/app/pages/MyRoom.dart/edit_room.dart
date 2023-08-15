import 'package:canary_app/app/pages/MyRoom.dart/a3lanRoom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/bacpicroom.dart';
import 'package:canary_app/app/pages/MyRoom.dart/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      IconButton(
                          color: Colors.black,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_applications_rounded,
                            size: 50,
                          )),
                      Container(
                        height: 50,
                        width: 270.w,
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
                             
                              helperStyle:
                                  TextStyle(color: Colors.white, ),
                              hintStyle:
                                  TextStyle(color: Colors.white, ),
                              hoverColor: Colors.blueGrey,
                              labelStyle:
                                  TextStyle(color: Colors.white, )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const States();
                    });
              },
              child: Card(
                elevation: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.note_alt),
                        Text(
                          "الحاله",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return const A3lanRoom();
                    });
              },
              child: Card(
                elevation: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.note_alt),
                        Text(
                          "اعلان الغرفه",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bacpicroom(),
                    ));
              },
              child: Card(
                elevation: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.photo_library,
                        ),
                        Text(
                          "اختيار خلفيه",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 11,
              child: SizedBox(
                height: 50.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 200.w,
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
                              helperStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hoverColor: Colors.blueGrey,
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "قفل الغرفه",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return const Adminroom();
                    });
              },
              child: Card(
                elevation: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.admin_panel_settings_outlined),
                        Text(
                          "ادارة المشرفين",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return const Blokroom();
                    });
              },
              child: Card(
                elevation: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                  child: SizedBox(height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.person_off_outlined),
                        Text(
                          "ادارة الطرد",
                          style: TextStyle(
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
