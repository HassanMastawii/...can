import 'package:canary_app/app/MyRoom.dart/mine_room/imoge/imoge.dart';
import 'package:canary_app/app/socket/link_socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_text_field.dart';

class ChatInputArea extends StatefulWidget {
  const ChatInputArea({
    Key? key,
    this.onSendText,
    this.onCameraPressed,
  }) : super(key: key);
  final void Function(String)? onSendText;
  final void Function()? onCameraPressed;

  @override
  State<ChatInputArea> createState() => _ChatInputAreaMobileState();
}

class _ChatInputAreaMobileState extends State<ChatInputArea> {
  final TextEditingController controler =
      TextEditingController(text: "welcome");
  bool notEmpty = false;
  @override
  void initState() {
    controler.addListener(() {
      if (controler.text.trim().isNotEmpty) {
        setState(() {
          notEmpty = true;
        });
      } else {
        setState(() {
          notEmpty = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  void textChatRoom() {
    SocketLink();
    // Start socket connection;
    socket!.connect();
    socket!.emit('text chat', 'send chat masseg');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5)
              .copyWith(top: 4, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ColoredBox(
                    color: const Color.fromARGB(200, 51, 48, 66),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(66)),
                                          height: 280.h,
                                          width: double.infinity,
                                          child: const ImogeMic());
                                    });
                              },
                              icon: const Icon(
                                Icons.emoji_emotions_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                                child: ChatTextField(
                              textEditingController: controler,
                            )),
                            IconButton(
                              onPressed: widget.onCameraPressed,
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              if (notEmpty)
                SizedBox(
                  height:
                      kBottomNavigationBarHeight - 10, // 10 => padding 5 + 5
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipOval(
                      child: GestureDetector(
                        onTap: () async {
                          widget.onSendText!(controler.text.trim());
                          textChatRoom();
                          controler.clear();
                        },
                        child: ColoredBox(
                          color: const Color.fromRGBO(19, 65, 192, 1),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 150),
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.send,
                              key: Key('send_icon'),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
