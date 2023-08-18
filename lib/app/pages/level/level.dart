import 'package:flutter/material.dart';

import '../../components/my_progres_bar.dart';
import '../../widgets/my_animated_button.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/pic_room.jpg"),
              ),
              Image.asset(
                "images/frame.png",
                width: 160,
                height: 160,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LVL 10",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
              Image.asset(
                "images/lv.png",
                height: 35,
                width: 35,
              ),
            ],
          ),
       Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text("10k"),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyprogressBar(value: 0.5),
                  ),
                ),
                Text("5k"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "القيمة الإجمالية \n 100,100",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 2,
                  height: 30,
                ),
                const Text(
                  "القيمة التي تحتاجها \n 100,100",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 120,
            child: Image.asset("images/title2.png", fit: BoxFit.fill),
          ),
          getListTile(
            rightText: "LVL 5",
            leftText: "1000 كونزة هدية",
          ),
          getListTile(
            rightText: "LVL 10",
            leftText: "3 أيام vip1",
          ),
          getListTile(
            rightText: "LVL 15",
            leftText: "3 أيام vip2",
          ),
          getListTile(
            rightText: "LVL 20",
            leftText: "7 أيام vip3",
          ),
          getListTile(
            rightText: "LVL 25",
            leftText: "7 أيام vip3",
          ),
          getListTile(
            rightText: "LVL 27",
            leftText: "7 أيام vip4",
          ),
          getListTile(
            rightText: "LVL 30",
            leftText: "id مميز 30 يوم",
          ),
          getListTile(
            rightText: "LVL 33",
            leftText: "15 أيام vip5",
          ),
          getListTile(
            rightText: "LVL 35",
            leftText: "id مميز 30 يوم",
          ),
          getListTile(
            rightText: "LVL 40",
            leftText: "15 أيام vip6",
          ),
        ],
      ),
      Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/pic_room.jpg"),
              ),
              Image.asset(
                "images/frame.png",
                width: 160,
                height: 160,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LVL 10",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
              Image.asset(
                "images/lv.png",
                height: 35,
                width: 35,
              ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text("10k"),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyprogressBar(value: 0.5),
                  ),
                ),
                Text("5k"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "القيمة الإجمالية \n 100,100",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 2,
                  height: 30,
                ),
                const Text(
                  "القيمة التي تحتاجها \n 100,100",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 120,
            child: Image.asset("images/title.png", fit: BoxFit.fill),
          ),
          getListTile(
            rightText: "LVL 5",
            leftText: "1000 كونزة هدية",
          ),
          getListTile(
            rightText: "LVL 10",
            leftText: "3 أيام vip1",
          ),
          getListTile(
            rightText: "LVL 15",
            leftText: "3 أيام vip2",
          ),
          getListTile(
            rightText: "LVL 20",
            leftText: "7 أيام vip3",
          ),
          getListTile(
            rightText: "LVL 25",
            leftText: "7 أيام vip3",
          ),
          getListTile(
            rightText: "LVL 27",
            leftText: "7 أيام vip4",
          ),
          getListTile(
            rightText: "LVL 30",
            leftText: "id مميز 30 يوم",
          ),
          getListTile(
            rightText: "LVL 33",
            leftText: "15 أيام vip5",
          ),
          getListTile(
            rightText: "LVL 35",
            leftText: "id مميز 30 يوم",
          ),
          getListTile(
            rightText: "LVL 40",
            leftText: "15 أيام vip6",
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: OverflowBox(
              maxHeight: MediaQuery.of(context).size.height,
              alignment: Alignment.topLeft,
              child: Image.asset(
                _index == 1
                    ? 'images/lvl_background.jpg'
                    : 'images/2lvl_background.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Row(
                  children: [
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyAnimatedButton(
                          isPressed: _index == 0,
                          text: "الثروة",
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
                        padding: const EdgeInsets.all(8.0),
                        child: MyAnimatedButton(
                          isPressed: _index == 1,
                          text: "الجاذبية",
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
                screens[_index],
              ],
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle style = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  Widget getListTile({
    required String rightText,
    required String leftText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            rightText,
            style: style,
          ),
          Text(
            leftText,
            style: style,
          ),
        ],
      ),
    );
  }
}
