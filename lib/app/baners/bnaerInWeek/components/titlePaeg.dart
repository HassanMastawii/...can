import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(11)),
        border: Border.all(color: Colors.black54, width: 2),
      ),
      child: const Center(
        child: Text(
          "ترتيب الاسبوع",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
