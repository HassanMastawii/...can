import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<String> filteredItems = [];
  List<String> allFiles = [];

  void updateFiles(List<String> filePaths) {
    filteredItems = [...filePaths];
    allFiles = [...allFiles, ...filePaths];
    notifyListeners();
  }

  void filterItems(String query) {
    notifyListeners();
  }
}
