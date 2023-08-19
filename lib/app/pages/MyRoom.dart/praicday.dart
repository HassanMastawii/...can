import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/cart_users.dart';

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
        SizedBox(height: 60.h,),
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
