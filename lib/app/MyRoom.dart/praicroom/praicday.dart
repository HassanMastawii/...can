import 'package:canary_app/app/MyRoom.dart/praicroom/cart_users.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Praicday extends StatefulWidget {
  const Praicday({super.key});

  @override
  State<Praicday> createState() => _PraicdayState();
}

class _PraicdayState extends State<Praicday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 56,
            itemBuilder: (context, index) {
              return const Carduserspricinroom();
            },
          ),
        ),
      ],
    );
  }
}
