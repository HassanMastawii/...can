import 'package:flutter/material.dart';

extension SizedBoxInt on int {
  SizedBox getWidthSizedBox() => SizedBox(
        width: toDouble(),
      );
  SizedBox getHightSizedBox() => SizedBox(
        height: toDouble(),
      );
}
