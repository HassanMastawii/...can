
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
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 56,
              itemBuilder: (context, index) {
                return const AccountCard();
              },
            ),
          ),
        ),
      ),
    );
  }
}
