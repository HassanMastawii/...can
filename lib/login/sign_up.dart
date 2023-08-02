
import 'package:canary_app/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

// ignore: camel_case_types
class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 197, 247, 247),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'images/1.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'email'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Username'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'password'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm password'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                  ),
                  Text(
                    '__________or__________',
                    style: GoogleFonts.cairo(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 70,
                        ),
                        SizedBox(
                          width: 44,
                        ),
                        Icon(
                          Icons.email,
                          color: Color.fromARGB(77, 230, 35, 35),
                          size: 70,
                        ),
                        SizedBox(
                          width: 44,
                        ),
                        Icon(
                          Icons.phone,
                          color: Colors.blue,
                          size: 70,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
