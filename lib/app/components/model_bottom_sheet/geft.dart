// ignore_for_file: avoid_unnecessary_containers

import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/MyRoom.dart/mic.dart';

class Geftbox extends StatefulWidget {
  const Geftbox({super.key});

  @override
  State<Geftbox> createState() => _GeftboxState();
}

class _GeftboxState extends State<Geftbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 85.h,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView(scrollDirection: Axis.horizontal, children: const [
              Mic(),
              Mic(),
              Mic(),
              Mic(),
              Mic(),
              Mic(),
              Mic(),
              Mic(),
              Mic(),
            ]),
          ),
        ),
        Container(
          height: 40,
          color: Colors.black87,
          child: ListView(
            //هاذه الليسته تغير قائمة الهدايا اللتي تحت
            scrollDirection: Axis.horizontal,
            children: const [
              MyButton(
                text: "جديد",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "علاقة",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "بلد",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "مشاهير",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "حقيبة",
                fontColor: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black87,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: 56,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Stack(alignment: Alignment.bottomCenter,
                          children: [
                            InkWell(
                              child: Container(
                                height: 59.h,
                                width: 59.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/sy.png'))),
                              ),
                            ),
                            const Text(
                              "name geft",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "2000",
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        Container(
          height: 61,
          width: double.infinity,
          color: Colors.black,
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              const Text(
                "<<الشحن",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 4,
              ),
              const Icon(
                Icons.paid_outlined,
                size: 35,
                color: Colors.amberAccent,
              ),
              const Text(
                "1999929",
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(
                flex: 4,
              ),
              TextButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(22),
                      fixedSize: MaterialStatePropertyAll(Size.zero),
                      iconSize: MaterialStatePropertyAll(20),
                      iconColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 201, 192, 163),
                      )),
                  onPressed: () {},
                  child: const Text(
                    "ارسال",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Spacer(flex: 1),
            ],
          ),
        )
      ],
    );
  }
}
