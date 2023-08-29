import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.fontColor,
    this.isLoading = false,
    this.size = 18,
  });
  final void Function()? onPressed;
  final String text;
  final double size;
  final Color? color;
  final bool isLoading;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
          backgroundColor: MaterialStatePropertyAll(color),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10, vertical: 2))),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: size,
                color: fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
