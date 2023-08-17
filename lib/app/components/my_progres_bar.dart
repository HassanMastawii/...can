import 'package:flutter/material.dart';

class MyprogressBar extends StatefulWidget {
  const MyprogressBar({super.key, required this.value});
  final double value;
  @override
  State<MyprogressBar> createState() => _MyprogressBarState();
}

class _MyprogressBarState extends State<MyprogressBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: FractionalOffset.topLeft,
          children: [
            Container(
              height: 36,
              width: constraints.maxWidth * widget.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 22, 99, 163),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 10,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
