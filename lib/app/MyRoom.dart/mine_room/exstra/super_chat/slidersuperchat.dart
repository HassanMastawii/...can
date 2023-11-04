import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/super_chat/card_super_chat.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderSuperchat extends StatefulWidget {
  const SliderSuperchat({super.key});

  @override
  State<SliderSuperchat> createState() => _SliderSuperchatState();
}

class _SliderSuperchatState extends State<SliderSuperchat> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: const [
        CardSuperchat(),
        CardSuperchat(),
        CardSuperchat(),
        CardSuperchat(),
      ],
    );
  }
}
