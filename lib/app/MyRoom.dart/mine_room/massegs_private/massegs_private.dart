import 'dart:async';

import 'package:canary_app/app/messages/list_chat_privt_inroom.dart';
import 'package:flutter/material.dart';

class MassegsPrivate extends StatefulWidget {
  const MassegsPrivate({super.key});

  @override
  State<MassegsPrivate> createState() => _MassegsPrivateState();
}

class _MassegsPrivateState extends State<MassegsPrivate> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        isVisible = !isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const ListChat();
              },
            );
          },
          icon: const Icon(
            Icons.mail,
            color: Colors.amber,
            size: 30,
          ),
        ),
        if (isVisible)
          Positioned(
            top: 5.0,
            right: 5.0,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
