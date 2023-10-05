import 'package:canary_app/app/provider/providers/music_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AddMusic extends StatefulWidget {
  final Function(List<String>) onFilesSelected;

  const AddMusic({Key? key, required this.onFilesSelected}) : super(key: key);

  @override
  State<AddMusic> createState() => _AddMusicState();
}

class _AddMusicState extends State<AddMusic> {
  Future<void> _requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      var result = await Permission.storage.request();
      if (result.isDenied || result.isPermanentlyDenied) {
        // Redirect the user to the app settings if the permission is permanently denied.
        openAppSettings();
      }
    }
  }

  List<String> filteredItems = []; // تحديد المتغير هنا

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    return IconButton(
      onPressed: () async {
        await _requestStoragePermission();
        FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp3'],
        );

        if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
          List<String> filePaths =
              pickedFiles.files.map((file) => file.path!).toList();
          musicProvider.updateFiles(filePaths);
        }
      },
      icon: const Icon(Icons.add_circle_outline_outlined),
    );
  }
}
