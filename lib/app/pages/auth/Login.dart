import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/home.dart';

class Login extends StatefulWidget {
  static const String ssroot = 'Login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    height: 200,
                  ),
                  // Text(
                  //   'مرحبا بكم',
                  //   style: GoogleFonts.cairo(fontSize: 48),
                  // ),
                  // Text(
                  //   'هيا بنا نستمتع في كناري شات',
                  //   style: GoogleFonts.cairo(fontSize: 28),
                  // ),
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
                              border: InputBorder.none, hintText: 'password'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        'forget password',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        'remember me',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Login',
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
                    height: 70,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 24,
                      ),
                      Text('Create new account?',
                          style: TextStyle(fontSize: 22)),
                      Text(
                        'create now',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      )
                    ],
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
