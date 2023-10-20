import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/kaesalhad/kisalhath.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/mic_plus/mic_pius.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/musicplayer/mesicplayr.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/sher/sher.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/super_chat/super_chat.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/vs/vs.dart';

import 'package:flutter/material.dart';

class Exstra extends StatefulWidget {
  const Exstra({super.key});

  @override
  State<Exstra> createState() => _ExstraState();
}

class _ExstraState extends State<Exstra> {
  void _showModalBottomSheetvs() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const Vs();
        });
  }

  void _showModalBottomSheetKisalhath() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Kisalhath();
      },
    );
  }

  void _showModalBottomSheetMicPlus() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const MicPlus();
      },
    );
  }

  void _showModalBottomSheetMusicPlayer() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const MusicPlayer();
      },
    );
  }

  void _showModalBottomSheetSuperChatinroom() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const MusicPlayer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  Navigator.pop(context);
                  _showModalBottomSheetKisalhath();
                },
                imag: "kisalhath.png",
                name: 'كيس الحظ',
              ),
              getimag(
                imag: "m.png",
                name: 'كرسي اضافي',
                ontap: () {
                  Navigator.pop(context);
                  _showModalBottomSheetMicPlus();
                },
              ),
              getimag(
                imag: "myosic.png",
                name: 'المسيقى',
                ontap: () {
                  Navigator.pop(context);
                  _showModalBottomSheetMusicPlayer();
                },
              ),
              getimag(
                ontap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const Sher();
                    },
                  );
                },
                imag: "sher.png",
                name: 'مشاركه',
              ),
              getimag(
                ontap: () {
                  Navigator.pop(context);
                  _showModalBottomSheetSuperChatinroom();
                },
                imag: "superchat.png",
                name: 'super chat',
              ),
              getimag(
                ontap: () {
                  Navigator.pop(context);
                  _showModalBottomSheetvs();
                },
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
