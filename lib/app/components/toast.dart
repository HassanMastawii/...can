import 'package:canary_app/app/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MySnackBar {
  static showMyToast({required String text}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static showDoneToast() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "تمت العملية بنجاح",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<bool> showYesNoDialog(
      BuildContext context, String content) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "تنبيه",
            ),
            content: Text(content),
            actions: [
              MyTextButton(
                text: "نعم",
                color: Colors.red,
                onTap: () {
                  Navigator.pop(context, true);
                },
              ),
              MyTextButton(
                text: "لا",
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        ) ??
        false;
  }
}
