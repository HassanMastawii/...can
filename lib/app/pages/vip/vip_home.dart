import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class Viphome extends StatefulWidget {
  const Viphome({Key? key}) : super(key: key);

  @override
  State<Viphome> createState() => _ViphomeState();
}

class _ViphomeState extends State<Viphome> {
  String selectedVip = 'vip1';
  double selectedRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.vip,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardvipnamber(text: 'vip1'),
                  cardvipnamber(text: 'vip2'),
                  cardvipnamber(text: 'vip3'),
                  cardvipnamber(text: 'vip4'),
                  cardvipnamber(text: 'vip5'),
                  cardvipnamber(text: 'vip6'),
                  cardvipnamber(text: 'vip7'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 12, // تغيير العدد حسب الحاجة
                itemExtent: MediaQuery.of(context).size.height / 3,
                itemBuilder: (BuildContext context, int index) {
                  return card2(
                      text: "$index",
                      img: "1.png"); // تغيير النص والصورة حسب الحاجة
                },
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
                    onTap: () {
                      print("object");
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
  }) {
    bool isSelected = text == selectedVip;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedVip = text;
            selectedRadius = isSelected ? 12.0 : 18.0;
          });
        },
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
  }) {
    return Container(
      color: Colors.blueAccent,
      height: MediaQuery.of(context).size.height / 3,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.amberAccent,
            radius: 40,
            child: Image.asset('images/vip/$img'),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
