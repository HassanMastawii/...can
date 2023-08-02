// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Welcom1.dart';

// ignore: camel_case_types
class Welcom extends StatefulWidget {
  static const String ssroot = 'Welcom';

  const Welcom({super.key});

  @override
  State<Welcom> createState() => _WelcomState();
}

// ignore: camel_case_types
class _WelcomState extends State<Welcom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(124, 140, 255, 255),
          body: Center(
            child: Column(
              children: [
                Image.asset(
                  'images/1.png',
                  height: 400,
                ),
                Text(
                  'Welcom',
                  style: GoogleFonts.actor(fontSize: 60),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    child: const Text('Next',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    // Within the `FirstRoute` widget
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcom1()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
