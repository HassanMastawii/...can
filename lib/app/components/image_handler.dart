import 'dart:io';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:flutter/material.dart';

class ImageHandler extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final bool fromServer;
  final double borderRadious;
  final double? radious;
  const ImageHandler({
    super.key,
    required this.path,
    this.fit,
    this.fromServer = false,
    this.borderRadious = 0,
    this.radious,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadious),
      child: getImage(),
    );
  }

  Widget getImage() {
    if (path.startsWith("/")) {
      return Image.network(
        "$serverLink$path",
        width: radious,
        height: radious,
        fit: fit,
      );
    } else if (path.startsWith("http")) {
      return Image.network(
        path,
        width: radious,
        height: radious,
        fit: fit,
      );
    } else if (path.startsWith("images")) {
      return Image.asset(
        path,
        width: radious,
        height: radious,
        fit: fit,
      );
    } else {
      return Image.file(
        File(path),
        width: radious,
        height: radious,
        fit: fit,
      );
    }
  }
}
