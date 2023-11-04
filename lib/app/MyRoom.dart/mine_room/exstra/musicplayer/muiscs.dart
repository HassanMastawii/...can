import 'package:canary_app/app/provider/providers/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class Muisics extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onFilesSelected;

  const Muisics({Key? key, required this.items, required this.onFilesSelected})
      : super(key: key);

  @override
  State<Muisics> createState() => _MuisicsState();
}

class _MuisicsState extends State<Muisics> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late List<String> items = widget.items;
  Set<String> newItems = {}; // تتبع الأغاني الجديدة

  @override
  void didUpdateWidget(covariant Muisics oldWidget) {
    super.didUpdateWidget(oldWidget);
    // تحديث الحالة هنا عندما يتغير widget.items
    if (widget.items != oldWidget.items) {
      // يمكنك إضافة المنطق هنا لتحديث الحالة عند تغيير قائمة الملفات
      setState(() {
        items = [...widget.items];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5,
      ),
      itemCount: musicProvider.filteredItems.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Center(
            child: Text(
              "لا يوجد اغاني في المكتبه",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        final currentSong = musicProvider.filteredItems[index - 1];
        final isNew = newItems.contains(currentSong);

        return Card(
          color: isNew ? Colors.green : Colors.black38,
          child: Stack(
            children: [
              ListTile(
                textColor: Colors.white,
                title: Text(currentSong),
              ),
              Positioned(
                left: 11,
                top: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () {
                    // استخدام الملف الصوتي من القائمة widget.items
                    String filePath = currentSong;

                    // تشغيل الملف الصوتي
                    _audioPlayer.setFilePath(filePath);
                    _audioPlayer.play();
                  },
                  icon: const Icon(
                    Icons.play_circle,
                    size: 33,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
