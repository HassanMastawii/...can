import 'package:canary_app/app/components/account_card.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({super.key, this.trailing});
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 35,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/pic_room.jpg"),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("محمد علي كلاي",
                                style: TextStyle(fontSize: 18)),
                            InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Text("id:5798462"),
                                    Icon(Icons.add_to_photos_outlined),
                                  ],
                                )),
                          ],
                        ),
                        if (trailing != null) trailing!
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getButton(
                          text: "22",
                          imageLink: "images/11.png",
                          width: 50,
                          hieght: 30,
                        ),
                        getButton(
                          text: "22",
                          imageLink: "images/to.png",
                          width: 50,
                          hieght: 50,
                        ),
                        getButton(
                          text: "22",
                          imageLink: "images/fam.png",
                          width: 50,
                          hieght: 30,
                        ),
                        getButton(
                          text: "22",
                          imageLink: "images/fam.png",
                          width: 50,
                          hieght: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
