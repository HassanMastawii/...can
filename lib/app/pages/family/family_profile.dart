import 'package:canary_app/app/pages/family/family_members.dart';
import 'package:canary_app/app/pages/family/family_stars.dart';
import 'package:canary_app/app/pages/family/family_supporter.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';

class FamilyProfile extends StatelessWidget {
  const FamilyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: OverflowBox(
                maxHeight: MediaQuery.of(context).size.height,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'images/create_family_background.png'
                      : 'images/create_family_background.png',
                  repeat: ImageRepeat.repeat,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            ListView(
              children: [
                10.getHightSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 50,
                          child: CircleAvatar(
                            radius: 44,
                            backgroundImage: AssetImage("images/pic_room.jpg"),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.yellow, width: 2)),
                          child: const Center(
                            child: Text(
                              " اسم العائلة ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      text: "ID:54654",
                      onPressed: () {},
                      color: const Color.fromARGB(255, 250, 136, 91),
                      fontColor: Colors.black,
                    ),
                    MyButton(
                      text: "LV:1",
                      onPressed: () {},
                      color: const Color.fromARGB(255, 250, 136, 91),
                      fontColor: Colors.black,
                    ),
                  ],
                ),
                50.getHightSizedBox(),
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 223, 232),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.yellow, width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FamilyMembers(),
                          ));
                        },
                        child: const Text(
                          "الأعضاء",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => getMember(),
                        ),
                      ),
                    ],
                  ),
                ),
                20.getHightSizedBox(),
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 223, 232),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.yellow, width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FamilySupporter(),
                          ));
                        },
                        child: const Text(
                          "الداعمون",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => getMember(),
                        ),
                      ),
                    ],
                  ),
                ),
                20.getHightSizedBox(),
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 223, 232),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.yellow, width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FamilyStars(),
                          ));
                        },
                        child: const Text(
                          "النجوم",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => getMember(),
                        ),
                      ),
                    ],
                  ),
                ),
                20.getHightSizedBox(),
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 223, 232),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.yellow, width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const FamilyStars(),
                          // ));
                        },
                        child: const Text(
                          "الغرف",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => getMember(),
                        ),
                      ),
                    ],
                  ),
                ),
                20.getHightSizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getMember({double rbig = 35, double rsmall = 33}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: rbig,
            child: CircleAvatar(
              radius: rsmall,
              backgroundImage: const AssetImage("images/pic_room.jpg"),
            ),
          ),
          const Text("محمد علي كلاي"),
        ],
      ),
    );
  }
}
