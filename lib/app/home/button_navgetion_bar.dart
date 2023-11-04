import 'dart:io';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/messages/home_chat.dart';
import 'package:canary_app/app/profail/my_profile.dart';

import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/domain/models/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_rooms.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getMyProfile();
    });

    super.initState();
  }

  getMyProfile() async {
    await context.read<CoreProvider>().getMyProfile().then((value) {
      if (value is DataState<Profile>) {
        context.read<CoreProvider>().myProfile = value.data;
        MySnackBar.showDoneToast();
      } else if (value is ErrorState) {
        MySnackBar.showMyToast(text: value.failure.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldexit = await MySnackBar.showYesNoDialog(
            context, "هل تريد الخروج من التطبيق ؟");
        if (shouldexit) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}
