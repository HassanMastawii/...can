import 'package:flutter/material.dart';

class Title2inPage extends StatelessWidget {
  const Title2inPage({
    Key? key,
    required this.texttetel,
    this.colortitel,
  });
  final String texttetel;
  final Color? colortitel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, right: 12, left: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: colortitel,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(22), bottomLeft: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.keyboard_double_arrow_left_sharp,
              size: 39,
            ),
            Text(
              texttetel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.volunteer_activism_rounded,
              size: 39,
            ),
          ],
        ),
      ),
    );
  }
}
