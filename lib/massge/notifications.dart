import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Center(child: Text("رسائل النظام")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text("2/4/2023  22:23"),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Center(
                  child: Text(
                      "....................................................................................................................................................................................................................................................................رسالة من البرنامج")),
            ),
          ),
          Text("2/4/2023  22:23"),
        ],
      ),
    );
  }
}
