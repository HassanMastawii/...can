import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/musicplayer/addmusic.dart';
import 'package:canary_app/app/MyRoom.dart/mine_room/exstra/musicplayer/muiscs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:canary_app/app/provider/providers/music_provider.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: AddMusic(
                    onFilesSelected: (filePaths) {},
                  ),
                ),
                const Center(
                  child: Text(
                    "مكتبة الأغاني ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      border: Border.all(width: 1, color: Colors.black45),
                    ),
                    child: TextField(
                      controller: musicProvider.searchController,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (query) {
                        musicProvider.filterItems(query);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    // يمكنك إزالة هذا واستخدام filterItems في onChanged
                    musicProvider
                        .filterItems(musicProvider.searchController.text);
                  },
                  child: const Text(
                    'بحث',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Muisics(
              items: musicProvider.filteredItems,
              onFilesSelected: musicProvider.updateFiles,
            ),
          ),
        ],
      ),
    );
  }
}
