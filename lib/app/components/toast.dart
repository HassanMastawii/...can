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
}
