import 'package:flutter/material.dart';

class MyRouter {
  static Future<T> myPush<T>(BuildContext context, Widget child) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }

  static Future<T> myPushReplacment<T>(
      BuildContext context, Widget child) async {
    return await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }

  static Future<T> myPushReplacmentAll<T>(
      BuildContext context, Widget child) async {
    return await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => child,
      ),
      (route) => false,
    );
  }
}
