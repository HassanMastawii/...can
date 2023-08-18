import 'package:flutter/material.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المتجر"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(left: 8, top: 4),
              child: Icon(
                Icons.card_giftcard,
                size: 33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
