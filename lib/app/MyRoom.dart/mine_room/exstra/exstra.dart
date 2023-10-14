import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/kaesalhad/kisalhath.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/musicplayer/mesicplayr.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/super_chat/super_chat.dart';

import 'package:canary_app/games/Roulette/Roulette.dart';
import 'package:flutter/material.dart';

class Exstra extends StatefulWidget {
  const Exstra({super.key});

  @override
  State<Exstra> createState() => _ExstraState();
}

class _ExstraState extends State<Exstra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 11,
          ),
          Wrap(
            children: [
              getimag(
                ontap: () {},
                imag: "adad.png",
                name: 'عداد',
              ),
              getimag(
                ontap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const Kisalhath();
                      });
                },
                imag: "kisalhath.png",
                name: 'كيس الحظ',
              ),
              getimag(
                imag: "m.png",
                name: 'كرسي اضافي',
                ontap: () {},
              ),
              getimag(
                imag: "myosic.png",
                name: 'المسيقى',
                ontap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const MusicPlayer();
                      });
                },
              ),
              getimag(
                ontap: () {
                  // Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                     builder: (context) =>  const MyHomePage(),
                  //                   ));
                },
                imag: "sher.png",
                name: 'مشاركه',
              ),
              getimag(
                ontap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SuperChatinroom();
                      });
                },
                imag: "superchat.png",
                name: 'super chat',
              ),
              getimag(
                imag: "vs11.png",
                name: 'التحدي',
              ),
            ],
          )
        ],
      ),
    );
  }
}

getimag({
  required String name,
  required String imag,
  void Function()? ontap,
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: InkWell(
      onTap: ontap,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(
              "images/exstra/$imag",
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
