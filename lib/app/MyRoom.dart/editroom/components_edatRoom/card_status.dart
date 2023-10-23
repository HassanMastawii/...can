import 'package:flutter/material.dart';

class CardStatus extends StatefulWidget {
  const CardStatus({
    super.key,
    required this.h,
    this.onTap,
  });
  final String h;
  final void Function()? onTap;
  @override
  State<CardStatus> createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(33)),
          height: 40,
          width: MediaQuery.sizeOf(context).width / 5,
          child: Center(
            child: Text(
              widget.h,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
