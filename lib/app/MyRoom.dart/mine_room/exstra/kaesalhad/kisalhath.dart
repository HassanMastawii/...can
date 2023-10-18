// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class Kisalhath extends StatefulWidget {
  const Kisalhath({Key? key}) : super(key: key);

  @override
  _KisalhathState createState() => _KisalhathState();
}

class _KisalhathState extends State<Kisalhath> {
  List<int> numbers = [50, 100, 250, 500];
  Set<int> selectedNumbers = {};
  bool showGlobalLuckImage = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  image: const DecorationImage(
                    image: AssetImage(
                      "images/exstra/k1.png",
                    ),
                  ),
                ),
                height: 80,
                width: 80,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "كيس الحظ العالمي",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: showGlobalLuckImage ? 70 : 0,
            child: showGlobalLuckImage
                ? Image.asset(
                    "images/exstra/k1.png",
                    width: 50,
                    height: 50,
                  )
                : null,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  onPressed: () {
                    setState(() {
                      numbers = generateNumbers();
                      showGlobalLuckImage = false;
                    });
                  },
                  color: Colors.amber,
                  fontColor: Colors.black,
                  text: "كيس الحظ",
                ),
                MyButton(
                  onPressed: () {
                    setState(() {
                      numbers = generateBiggerNumbers();
                      showGlobalLuckImage = true;
                    });
                  },
                  color: Colors.amber,
                  fontColor: Colors.black,
                  text: " كيس الحظ الدولي",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: numbers.map((number) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedNumbers.contains(number)) {
                          selectedNumbers.remove(number);
                        } else {
                          selectedNumbers.add(number);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: selectedNumbers.contains(number)
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        number.toString(),
                        style: TextStyle(
                          color: selectedNumbers.contains(number)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 33),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "<<الشحن",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: const Icon(
                  Icons.paid_outlined,
                  size: 25,
                  color: Colors.amberAccent,
                ),
              ),
              const Text(
                "1999929",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SizedBox(
              width: 200,
              child: MyButton(
                onPressed: () {
                  List<int> selectedValues = selectedNumbers.toList();
                  print("الأرقام المحددة: $selectedValues");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 30,
                                child: CircleAvatar(
                                  radius: 29,
                                  backgroundImage:
                                      const AssetImage("images/pic_room.jpg"),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("user name"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("ID:15638383392"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("لقد ارسلت كيس الحظ العالمي"),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 11),
                                    child: const Icon(
                                      Icons.paid_outlined,
                                      size: 25,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                  Text(
                                    "$selectedValues",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CircleAvatar(
                                radius: 44,
                                backgroundColor: Colors.amber,
                                child: Text("فتح"),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                color: Colors.amber,
                fontColor: Colors.black,
                text: "ارسال",
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<int> generateNumbers() {
    return [50, 100, 250, 500];
  }

  List<int> generateBiggerNumbers() {
    return [1000, 2500, 5000, 10000];
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Color fontColor;
  final String text;

  const MyButton({
    required this.onPressed,
    required this.color,
    required this.fontColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: fontColor,
      ),
      child: Text(text),
    );
  }
}
