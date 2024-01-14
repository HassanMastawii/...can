import 'package:canary_app/app/baners/bnaerInWeek/components/title2.dart';
import 'package:flutter/material.dart';

class RankingCPlove extends StatefulWidget {
  const RankingCPlove({super.key});

  @override
  State<RankingCPlove> createState() => _RankingCPloveState();
}

class _RankingCPloveState extends State<RankingCPlove> {
  bool isEnlarged = false;
  @override
  Widget build(BuildContext context) {
    return isEnlarged ? enlargedRankingCPlove() : RankingCPlove();
  }

  RankingCPlove() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(4)),
        width: double.infinity,
        height: 330,
        child: Column(
          children: [
            const Title2inPage(
                texttetel: "ترتيب الاحبه CP", colortitel: Colors.redAccent),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: getCPStaile(
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
                              getCPStaile(
                                nemberRanking: "2",
                                colorRankig: Colors.grey[400],
                              ),
                              getCPStaile(
                                nemberRanking: "3",
                                colorRankig: Colors.orange[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                        visible: !isEnlarged,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: isEnlarged ? 0.0 : 1.0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isEnlarged = true;
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

  enlargedRankingCPlove() {
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
            child: RankingCPlove(),
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
                        const Text(" -   "),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 27,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/pic_room.jpg"),
                                  radius: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 27,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/pic_room.jpg"),
                                  radius: 25,
                                ),
                              ),
                            ),
                          ],
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
                  isEnlarged = !isEnlarged;
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

  getCPStaile({
    required String nemberRanking,
    required colorRankig,
  }) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: colorRankig,
          child: Text(
            nemberRanking,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 27,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/pic_room.jpg"),
                  radius: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 27,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/pic_room.jpg"),
                  radius: 25,
                ),
              ),
            ),
          ],
        ),
        const Text(
          "hassan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text("ID:123456789"),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "999 K",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
