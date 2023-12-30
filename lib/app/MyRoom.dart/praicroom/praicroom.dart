import 'package:canary_app/app/MyRoom.dart/praicroom/praicmonthe.dart';

import 'package:canary_app/domain/models/user_coin.dart';
import 'package:flutter/material.dart';

class Praicroom extends StatefulWidget {
  const Praicroom({Key? key, required this.userList}) : super(key: key);
  final List<UserCoin> userList;
  @override
  State<Praicroom> createState() => _PraicroomState();
}

class _PraicroomState extends State<Praicroom> with TickerProviderStateMixin {
  late final TabController _pageController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _pageController,
          tabs: const [
            Tab(
              child: Text("سنوي"),
            ),
            Tab(
              child: Text("شهري"),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _pageController,
            children: [
              Praicmonthe(userList: widget.userList),
              Praicmonthe(userList: widget.userList),
            ],
          ),
        ),
      ],
    );
  }
}
