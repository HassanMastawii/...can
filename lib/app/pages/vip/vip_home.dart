import 'package:flutter/material.dart';

class Viphome extends StatefulWidget {
  const Viphome({Key? key}) : super(key: key);

  @override
  State<Viphome> createState() => _ViphomeState();
}

class _ViphomeState extends State<Viphome> {
  String selectedVip = 'vip1'; // يحفظ نص الـ VIP المختار
  double selectedRadius = 12.0; // يحفظ قيمة الريديوس المختار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardvipnamber(text: 'vip1'),
                  cardvipnamber(text: 'vip2'),
                  cardvipnamber(text: 'vip3'),
                  cardvipnamber(text: 'vip4'),
                  cardvipnamber(text: 'vip5'),
                  cardvipnamber(text: 'vip6'),
                  cardvipnamber(text: 'vip7'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardvipnamber({
    required String text,
  }) {
    bool isSelected = text == selectedVip;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedVip = text;
            selectedRadius = isSelected ? 12.0 : 18.0;
          });
        },
        child: Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.black : Colors.white,
            ),
            color: isSelected ? Colors.amberAccent : Colors.amberAccent[200],
            borderRadius: BorderRadius.circular(selectedRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:  Colors.black 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
