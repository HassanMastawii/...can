import 'package:flutter/material.dart';

class StaerWeck extends StatefulWidget {
  const StaerWeck({super.key});

  @override
  State<StaerWeck> createState() => _StaerWeckState();
}

class _StaerWeckState extends State<StaerWeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    border: Border.all(color: Colors.black54, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      "ترتيب الاسبوع",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
