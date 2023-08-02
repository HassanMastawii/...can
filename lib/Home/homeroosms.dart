// ignore_for_file: camel_case_types

import 'package:canary_app/Home/rooms.dart';
import 'package:flutter/material.dart';

class homerooms extends StatefulWidget {
  const homerooms({super.key});

  @override
  State<homerooms> createState() => _homeroomsState();
}

class _homeroomsState extends State<homerooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      height: double.infinity,
      width: double.infinity,
      child: const Rooms(),
    );
  }
}
