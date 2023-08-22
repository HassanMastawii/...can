import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:canary_app/app/components/my_progres_bar.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  Timer? timer;
  final recorder = FlutterSoundRecorder();
  RecordState recordState = RecordState.none;
  bool isPlay = false;
  final player = AudioPlayer();
  String? filePath;
  @override
  void dispose() {
    timer?.cancel();
    recorder.closeRecorder();
    super.dispose();
  }

  Future record() async {
    final status = await Permission.microphone.request();
    recorder.openRecorder();
    if (status.isGranted) {
      await recorder.startRecorder(
        toFile: 'audio.aac',
      );
      setState(() {
        recordState = RecordState.recording;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timer.tick > 29) {
          stop();
        } else {
          setState(() {});
        }
      });
    } else {
      MySnackBar.showMyToast(
          text: "تعذر تسجيل المقطع لعدم وجود الصلاحيات الكافية");
    }
  }

  Future stop() async {
    if (timer!.tick < 5) {
      MySnackBar.showMyToast(text: "المقطع صغير جدا");
      setState(() {
        timer?.cancel();
        recordState = RecordState.none;
      });
      await recorder.stopRecorder();
    } else {
      filePath = await recorder.stopRecorder();
      setState(() {
        timer?.cancel();
        recordState = RecordState.recorded;
      });
    }
  }

  play() async {
    setState(() {
      isPlay = true;
    });
    await player.play(DeviceFileSource(filePath!));
    player.onPlayerComplete.listen((event) {
      pause();
    });
  }

  pause() {
    setState(() {
      player.pause();
      isPlay = false;
    });
  }

  restart() async {
    await recorder.deleteRecord(fileName: 'audio.aac');
    player.stop();
    setState(() {
      recordState = RecordState.none;
      isPlay = false;
      filePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: OverflowBox(
              maxHeight: MediaQuery.of(context).size.height,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/create_family_background.png',
                repeat: ImageRepeat.repeat,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.logout,
                                size: 40,
                                color: Colors.white,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "تسجيل صوتي",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (recordState != RecordState.none)
                  MyprogressBar(value: (timer?.tick.toDouble() ?? 0) / 30),
                recordState == RecordState.none
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton.filledTonal(
                            onPressed: record,
                            icon: const Icon(
                              Icons.mic,
                              size: 40,
                            )),
                      )
                    : recordState == RecordState.recording
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton.filledTonal(
                                onPressed: stop,
                                icon: const Icon(
                                  Icons.stop,
                                  size: 40,
                                )),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton.filledTonal(
                                    onPressed: restart,
                                    icon: const Icon(
                                      Icons.replay,
                                      size: 40,
                                    )),
                                isPlay
                                    ? IconButton.filledTonal(
                                        onPressed: pause,
                                        icon: const Icon(
                                          Icons.pause,
                                          size: 40,
                                        ))
                                    : IconButton.filledTonal(
                                        onPressed: play,
                                        icon: const Icon(
                                          Icons.play_arrow,
                                          size: 40,
                                        )),
                                IconButton.filledTonal(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.done,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                recordState == RecordState.none
                    ? const Text(
                        "اضغط لبدء التسجيل",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : recordState == RecordState.recording
                        ? const Text(
                            "اضغط للانهاء",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        : const SizedBox.shrink(),
                if (recordState != RecordState.recorded)
                  const Text(
                    "تتراوح مدة التسجيل بين ال 5 ثواني حتى ال 30 ثانية",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                10.getHightSizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum RecordState {
  recording,
  recorded,
  none,
}
