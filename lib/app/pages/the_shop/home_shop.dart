// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/pages/the_shop/cars.dart';
import 'package:canary_app/app/pages/the_shop/chat_box.dart';
import 'package:canary_app/app/pages/the_shop/entryforroom.dart';
import 'package:canary_app/app/pages/the_shop/frames.dart';
import 'package:canary_app/app/pages/the_shop/personalSnaps.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedTab = 0;
  int _selectedText = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    setState(() {
      _selectedTab = page;
      _selectedText = page;
    });

    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                color: buttons,
                borderRadius: BorderRadius.circular(11),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  size: 33,
                  color: Colors.black,
                ),
                label: const Text(
                  "الحقيبه",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
        title: const Center(child: Text("المركز التجاري")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTabButton(0, 'مركز الاطارات'),
                  _buildTabButton(1, 'معرض السيارات'),
                  _buildTabButton(2, 'صندوق الدردشه'),
                  _buildTabButton(3, 'اعلان الدخول'),
                  _buildTabButton(4, 'العلاقات الشخصيه'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  150, // تعديل الارتفاع هنا
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _selectedTab = page;
                    _selectedText = page;
                  });
                },
                children: const <Widget>[
                  Frames(),
                  Cars(),
                  Chatboxinshop(),
                  Entryforroom(),
                  // Zinatprofile(),
                  Personalsnaps(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(int page, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _goToPage(page);
        },
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: _selectedText == page ? Colors.white : Colors.black,
          ),
          primary: _selectedTab == page ? buttons : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: _selectedTab == page
                  ? const Color.fromARGB(255, 5, 73, 129)
                  : Colors.black.withOpacity(0.1),
              width: 2,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
