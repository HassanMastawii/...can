import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.onTap,
  });
  final Color color;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(color),
        overlayColor: MaterialStatePropertyAll(color.withOpacity(0.2)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
