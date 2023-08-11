// ignore_for_file: file_names

import 'package:canary_app/app/pages/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';

class Welcom1 extends StatefulWidget {
  static const String ssroot = 'Welcom1';
  const Welcom1({super.key});

  @override
  State<Welcom1> createState() => _Welcom1State();
}

class _Welcom1State extends State<Welcom1> {
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
                  height: 300,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.actor(fontSize: 48),
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    // Within the `FirstRoute` widget
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    }),
                ElevatedButton(
                  child: const Text('Sign up',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const sign_up()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
