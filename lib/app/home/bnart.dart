import 'package:flutter/material.dart';

class Baner extends StatefulWidget {
  const Baner({super.key});

  @override
  State<Baner> createState() => _BanerState();
}

class _BanerState extends State<Baner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.circular(11),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/bnar1.png',
                  ))),
        ),
      ),
    );
  }
}
