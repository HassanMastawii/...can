import 'package:canary_app/app/MyRoom.dart/praicroom/cart_users.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Praicmonthe extends StatefulWidget {
  const Praicmonthe({super.key});

  @override
  State<Praicmonthe> createState() => _PraicmontheState();
}

class _PraicmontheState extends State<Praicmonthe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
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
