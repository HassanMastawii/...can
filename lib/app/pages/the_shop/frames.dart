import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class Frames extends StatefulWidget {
  const Frames({super.key});

  @override
  State<Frames> createState() => _FramesState();
}

class _FramesState extends State<Frames> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 56,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: appcolor.shopcontenaer,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: const Row(
                      children: [
                        Text("data"),
                        Spacer(),
                        Icon(Icons.access_time_filled),
                        Text("15day")
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset('images/shop/frames/1.png')),
                  Text(
                    '1000',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[400]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          decoration: const BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: const Text(
                            "شراء",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amberAccent, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: const Text(
                            "اهداء",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
