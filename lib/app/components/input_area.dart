import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model_bottom_sheet/imoge.dart';

class InputArea extends StatefulWidget {
  const InputArea({super.key, this.onSend, required this.controller});
  final void Function()? onSend;
  final TextEditingController controller;
  @override
  State<InputArea> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  bool isMic = true;
  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        isMic = true;
      } else {
        isMic = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(66)),
                            height: 280.h,
                            width: double.infinity,
                            child: const ImogeMic());
                      });
                },
                icon: const Icon(
                  Icons.mood,
                  size: 32,
                  color: Colors.white,
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 32,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11),
                child: TextField(
                  controller: widget.controller,
                  minLines: 1,
                  maxLines: 6,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Visibility(
              visible: isMic,
              replacement: IconButton(
                onPressed: widget.onSend,
                icon: const Icon(
                  Icons.send,
                  size: 44,
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  size: 44,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
