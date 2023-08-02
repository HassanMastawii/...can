// ignore_for_file: file_names


import 'package:canary_app/Home/homeroosms.dart';
import 'package:canary_app/Home/profail.dart';
import 'package:canary_app/massge/Masseg.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  int _Index = 2;

  final List<Widget> _pages = [
    const Profail(),
    const Masseg(),
    const homerooms(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_Index],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromRGBO(144, 202, 249, 1),
    height: 55,
        backgroundColor: Colors.black12,
        animationDuration: const Duration(milliseconds: 400),
        buttonBackgroundColor:  Colors.blueAccent[200],
        animationCurve: Curves.linear,
        items: const <Widget>[
          Icon(
            Icons.person,
            size: 40,
           
          ),
          Icon(
            Icons.mail_outline,
            size: 40,
           
          ),
          Icon(
            Icons.house_outlined,
            size: 40,
            
          ),
        ],
        index: 2,
        onTap: (index) {
          setState(() {
            _Index = index;
          });
        },
      ),
    );
  }
}
