import 'package:canary_app/app/MyRoom.dart/praicroom/praicday.dart';
import 'package:canary_app/app/MyRoom.dart/praicroom/praicmonthe.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';

class Praicroom extends StatefulWidget {
  const Praicroom({Key? key, required this.userList}) : super(key: key);
  final List<UserCoin> userList;
  @override
  State<Praicroom> createState() => _PraicroomState();
}

class _PraicroomState extends State<Praicroom> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageViewExample(_pageController),
        Card(
          elevation: 22,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 8),
            child: Row(
              children: [
                MyButton(
                  text: "يومي",
                  fontColor: Colors.white,
                  color: _currentPage == 0
                      ? Colors.blueAccent[700]
                      : Colors.black.withOpacity(0.2),
                  onPressed: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _currentPage = 0;
                    });
                  },
                ),
                const Spacer(),
                MyButton(
                  text: "سنوي",
                  fontColor: Colors.white,
                  color: _currentPage == 1
                      ? Colors.blueAccent[700]
                      : Colors.black.withOpacity(0.2),
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _currentPage = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PageViewExample extends StatelessWidget {
  final PageController pageController;

  const PageViewExample(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
      ),
    );
  }
}

final List<Widget> pages = [
  const Praicday(),
  const Praicmonthe(),
];
