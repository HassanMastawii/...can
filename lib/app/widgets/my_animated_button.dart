import 'package:flutter/material.dart';

class MyAnimatedButton extends StatelessWidget {
  const MyAnimatedButton(
      {super.key, required this.isPressed, required this.text, this.onTap});
  final bool isPressed;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isPressed ? Colors.black87 : Colors.black45,
            borderRadius: isPressed
                ? BorderRadius.circular(22)
                : BorderRadius.circular(15),
            border: isPressed
                ? Border.all(
                    color: Colors.amber,
                    width: 3,
                  )
                : null),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
