import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import '../../components/account_card.dart';

class Ferind extends StatefulWidget {
  const Ferind({super.key});

  @override
  State<Ferind> createState() => _FerindState();
}

class _FerindState extends State<Ferind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButton(text: "الأصدقاء"),
                    MyButton(text: "الرسائل"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black),
                      color: Colors.grey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44))),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 56,
                    itemBuilder: (context, index) {
                      return const AccountCard();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
