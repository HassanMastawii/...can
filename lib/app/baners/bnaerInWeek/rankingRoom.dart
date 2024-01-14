import 'package:canary_app/app/baners/bnaerInWeek/components/listePecAndName.dart';
import 'package:canary_app/app/baners/bnaerInWeek/components/title2.dart';

import 'package:flutter/material.dart';

class RankingRoom extends StatefulWidget {
  const RankingRoom({super.key});

  @override
  State<RankingRoom> createState() => _RankingRoomState();
}

class _RankingRoomState extends State<RankingRoom> {
  bool isEnlargedRoom = false;
  @override
  Widget build(BuildContext context) {
    return isEnlargedRoom ? enlargedRankingRoom() : RankingRoom();
  }

  RankingRoom() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(4)),
        width: double.infinity,
        height: 330,
        child: Column(
          children: [
            Title2inPage(
                texttetel: "ترتيب الغرف", colortitel: Colors.deepPurple[400]),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: ListePicAndName(
                        nemberRanking: "1",
                        colorRankig: Colors.yellow,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          bottom: 14,
                          left: 14,
                          right: 14,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListePicAndName(
                                nemberRanking: "2",
                                colorRankig: Colors.grey[400],
                              ),
                              ListePicAndName(
                                nemberRanking: "3",
                                colorRankig: Colors.orange[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                        visible: !isEnlargedRoom,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: isEnlargedRoom ? 0.0 : 1.0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isEnlargedRoom = true;
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_double_arrow_down_sharp,
                                size: 33,
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  enlargedRankingRoom() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(4)),
      width: double.infinity,
      height: 700,
      child: Column(
        children: [
          SizedBox(
            height: 330,
            width: double.infinity,
            child: RankingRoom(),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 17,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("4"),
                        const Text(" -"),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 26,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/pic_room.jpg"),
                              radius: 25,
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Text("user name"),
                            Text("ID:123456789"),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            "999 K",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isEnlargedRoom = !isEnlargedRoom;
                });
              },
              icon: const Icon(
                Icons.keyboard_double_arrow_up_sharp,
                size: 33,
              )),
        ],
      ),
    );
  }
}
