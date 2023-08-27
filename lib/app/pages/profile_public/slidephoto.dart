import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Slaidphoto extends StatefulWidget {
  const Slaidphoto({super.key});

  @override
  State<Slaidphoto> createState() => _SlaidphotoState();
}

class _SlaidphotoState extends State<Slaidphoto> {
  @override
  Widget build(BuildContext context) {
    return const ImageSlideshow(
      disableUserScrolling: false,
      autoPlayInterval: 3000,
      isLoop: true,
      indicatorRadius: 4,
initialPage: 0,
      children: [
        Photo(),
        Photo(),
        Photo(),
        Photo(),
        Photo(),
      ],
    );
  }
}

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("images/pic_room.jpg"))),
    );
  }
}
