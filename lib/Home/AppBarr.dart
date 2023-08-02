// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppBarr extends StatefulWidget {
  const AppBarr({super.key});

  @override
  State<AppBarr> createState() => __AppBarrState();
}

class __AppBarrState extends State<AppBarr> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            width: 300,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                  iconSize: 40,
                ),
                const SizedBox(width: 99),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Trend',
                    style: TextStyle(color: Colors.amberAccent, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'My Visits',
                    style: TextStyle(color: Colors.amberAccent, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
