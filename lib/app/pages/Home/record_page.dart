import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String filePath) async {
    try {
      await audioPlayer.setFilePath(filePath);
      await audioPlayer.play();
      audioPlayer.playerStateStream.listen((playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          setState(() {
            isPlaying = false;
          });
        }
      });
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      // Handle any errors here
    }
  }

  void _stopAudio() async {
    try {
      await audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل صوتي'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add UI for recording and stopping here
            ElevatedButton(
              onPressed: () {
                // Handle recording logic here
              },
              child: Text('بدء التسجيل'),
            ),
            SizedBox(height: 20),
            if (isPlaying)
              ElevatedButton(
                onPressed: () {
                  _stopAudio();
                },
                child: Text('إيقاف التشغيل'),
              )
            else
              ElevatedButton(
                onPressed: () {
                  // Replace 'audioFilePath' with the actual audio file path
                  _playAudio('audioFilePath');
                },
                child: Text('تشغيل الصوت'),
              ),
          ],
        ),
      ),
    );
  }
}
