import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class Viphome extends StatefulWidget {
  const Viphome({Key? key}) : super(key: key);

  @override
  State<Viphome> createState() => _ViphomeState();
}

class _ViphomeState extends State<Viphome> {
  int selectedVip = 1;
  double selectedRadius = 12.0;
  List<VipItem> vipItems = [
    VipItem("1", "1.png", 1),
    VipItem("2", "1.png", 1),
    VipItem("3", "1.png", 2),
    VipItem("4", "1.png", 2),
    VipItem("5", "1.png", 3),
    VipItem("6", "1.png", 4),
    VipItem("7", "1.png", 5),
    VipItem("8", "1.png", 6),
    VipItem("9", "1.png", 7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vip,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardvipnamber(
                    text: 'vip1',
                    isSelected: selectedVip == 1,
                    ontap: () {
                      setState(() {
                        selectedVip = 1;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip2',
                    isSelected: selectedVip == 2,
                    ontap: () {
                      setState(() {
                        selectedVip = 2;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip3',
                    isSelected: selectedVip == 3,
                    ontap: () {
                      setState(() {
                        selectedVip = 3;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip4',
                    isSelected: selectedVip == 4,
                    ontap: () {
                      setState(() {
                        selectedVip = 4;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip5',
                    isSelected: selectedVip == 5,
                    ontap: () {
                      setState(() {
                        selectedVip = 5;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip6',
                    isSelected: selectedVip == 6,
                    ontap: () {
                      setState(() {
                        selectedVip = 6;
                      });
                    },
                  ),
                  cardvipnamber(
                    text: 'vip7',
                    isSelected: selectedVip == 7,
                    ontap: () {
                      setState(() {
                        selectedVip = 7;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: vipItems.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                ),
                itemBuilder: (context, index) => card2(
                  text: vipItems[index].name,
                  img: vipItems[index].pic,
                  requiredVip: vipItems[index].requiredVipLevel,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 44),
                    child: Text(
                      "user name",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/pic_room.jpg"),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "10,000ذهب/30 يوم",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "التجديد8,000ذهب/30 يوم",
                        style: TextStyle(
                            color: Color.fromARGB(255, 202, 201, 201),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("تأكيد الشراء"),
                            content: Text("هل أنت متأكد من رغبتك في الشراء؟"),
                            actions: [
                              TextButton(
                                child: Text("إلغاء"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("تأكيد"),
                                onPressed: () {
                                  // هنا يمكنك إجراء الشراء أو الإجراء الذي ترغب فيه
                                  Navigator.of(context)
                                      .pop(); // إغلاق الديالوج بعد الشراء
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "شراء",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "اهداء",
                          style: TextStyle(
                              color: Color.fromARGB(255, 202, 201, 201),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardvipnamber({
    required String text,
    required bool isSelected,
    required void Function()? ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.black : Colors.white,
            ),
            color: isSelected ? Colors.amberAccent : Colors.amberAccent[200],
            borderRadius: BorderRadius.circular(selectedRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget card2({
    required String text,
    required String img,
    required int requiredVip,
  }) {
    return Container(
      color: Colors.blueAccent,
      height: MediaQuery.of(context).size.height / 3,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                if (requiredVip <= selectedVip)
                  const BoxShadow(color: Colors.amber, blurRadius: 25),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.amberAccent,
              radius: 40,
              child: Image.asset('images/vip/$img'),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: requiredVip <= selectedVip ? Colors.amber : null,
            ),
          )
        ],
      ),
    );
  }
}

class VipItem {
  final String name;
  final String pic;
  final int requiredVipLevel;

  VipItem(this.name, this.pic, this.requiredVipLevel);
}
