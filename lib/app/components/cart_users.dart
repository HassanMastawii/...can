import 'package:flutter/material.dart';

class Carduserspricinroom extends StatefulWidget {
  const Carduserspricinroom({super.key});

  @override
  State<Carduserspricinroom> createState() => _CarduserspricinroomState();
}

class _CarduserspricinroomState extends State<Carduserspricinroom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 11,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/pic_room.jpg"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "user name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("123456789"),
                    Text(":ID"),
                    Icon(Icons.library_add_rounded),
                  ],
                ),
                Row(
                  children: [
                    getButton(
                      text: "22",
                      imageLink: "images/11.png",
                      width: 50,
                      hieght: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: getButton(
                        text: "22",
                        imageLink: "images/to.png",
                        width: 50,
                        hieght: 50,
                      ),
                    ),
                    getButton(
                      text: "15",
                      imageLink: "images/fam.png",
                      width: 50,
                      hieght: 30,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.yellow),
                      side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.amber),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightBlueAccent)),
                  onPressed: () {},
                  icon: const Icon(Icons.attach_money_rounded),
                  label: const Text("1000")),
            )
          ],
        ),
      ),
    );
  }
}

getButton({
  void Function()? onTap,
  required String text,
  required String imageLink,
  double hieght = 50,
  double width = 125,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: hieght,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageLink), fit: BoxFit.fill),
        borderRadius: const BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
