import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowProfailFrendInRoom extends StatefulWidget {
  const ShowProfailFrendInRoom({super.key});

  @override
  State<ShowProfailFrendInRoom> createState() => _ShowProfailFrendInRoomState();
}

class _ShowProfailFrendInRoomState extends State<ShowProfailFrendInRoom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 50,
                  )),
              const Spacer(
                flex: 6,
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: const Color.fromARGB(207, 255, 224, 85)),
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.black,
                        image: const DecorationImage(
                            image: AssetImage('images/pic_room.jpg'))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 11),
                    child: Text(
                      "user name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 11,
              )
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(alignment: const Alignment(-1 / 2, 0), children: [
                Container(
                  width: 44.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/11.png")),
                    // color: Colors.redAccent
                  ),
                ),
                const Text(
                  "22",
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(alignment: const Alignment(-1 / 2, 0), children: [
                Container(
                  width: 44.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/11.png")),
                    // color: Colors.redAccent
                  ),
                ),
                const Text(
                  "22",
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(alignment: const Alignment(-1 / 2, 0), children: [
                Container(
                  width: 44.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/fam.png")),
                    // color: Colors.redAccent
                  ),
                ),
                const Text(
                  "22",
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(alignment: const Alignment(-1 / 2, 0), children: [
                Container(
                  width: 44.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/fam.png")),
                    // color: Colors.redAccent
                  ),
                ),
                const Text(
                  "22",
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.library_add_rounded)),
            const Text("ID: ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const Text("1234567890",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            const Text("500"),
            const Text(
              ":المتابعين",
              style: TextStyle(fontSize: 20),
            ),
          ]),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.all(11),
          child: Text(
              "jjjjjsfdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Container(
            height: 66,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                    color: Colors.amberAccent,
                    width: 3,
                    style: BorderStyle.solid)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(6.0),
                  //     child: Image.asset("images/geftbox.png"),
                  //   ),
                  // ),
                  Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.gif_box_outlined,
                            color: Colors.amberAccent,
                            size: 44,
                          ))),
                  Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Colors.amberAccent,
                            size: 44,
                          ))),
                  Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "@",
                            style: TextStyle(
                                fontSize: 29, color: Colors.amberAccent),
                          ))),
                  Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_add_alt,
                            color: Colors.amberAccent,
                            size: 44,
                          ))),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
