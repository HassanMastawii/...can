import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_chat.dart';
import 'home_rooms.dart';
import 'my_profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 2;

  final List<Widget> _pages = const [
    MyProfile(),
    HomeChat(),
    HomeRooms(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromRGBO(144, 202, 249, 1),
        height: 55,
        // backgroundColor: Colors.black12,
        animationDuration: const Duration(milliseconds: 400),
        // buttonBackgroundColor: Colors.blueAccent[200],
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
            _index = index;
          });
        },
      ),
    );
  }
}
