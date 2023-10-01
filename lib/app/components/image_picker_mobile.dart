import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerMobile extends StatefulWidget {
  const ImagePickerMobile({
    super.key,
    required this.imageController,
    required this.radius,
    this.width = 125,
    this.height = 125,
  });
  final TextEditingController imageController;
  final double radius;
  final double width;
  final double height;
  @override
  State<ImagePickerMobile> createState() => _ImagePickerMobileState();
}

class _ImagePickerMobileState extends State<ImagePickerMobile> {
  final ImagePicker picker = ImagePicker();

  fromGallery() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      widget.imageController.text = await imageCroper(value!.path);
      setState(() {});
    });
  }

  fromCamera() async {
    await picker.pickImage(source: ImageSource.camera).then((value) async {
      widget.imageController.text = await imageCroper(value!.path);
      setState(() {});
    });
  }

  Future<String> imageCroper(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        maxHeight: 500,
        maxWidth: 500,
        aspectRatio: const CropAspectRatio(ratioX: 500, ratioY: 500),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Theme.of(context).scaffoldBackgroundColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ]);
    if (croppedFile == null) {
      return "";
    }
    return croppedFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: widget.imageController.text.isEmpty
              ? InkWell(
                  onTap: () {
                    showMySheet();
                  },
                  child: Container(
                    width: widget.width,
                    color: Colors.white,
                    height: widget.height,
                    child: const Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                )
              : Image.file(
                  File(widget.imageController.text),
                  width: widget.width,
                  height: widget.height,
                ),
        ),
        if (widget.imageController.text.isNotEmpty)
          SizedBox(
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                  onPressed: () {
                    setState(() {
                      widget.imageController.text = "";
                    });
                  },
                  color: Colors.red,
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
                IconButton.filled(
                  onPressed: () {
                    showMySheet();
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
      ],
    );
  }

  showMySheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.2,
        maxChildSize: 0.2,
        initialChildSize: 0.2,
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          children: [
            ListTile(
              leading: const Icon(Icons.collections_outlined),
              title: const Text("الاستديو"),
              onTap: () {
                Navigator.pop(ctx);
                fromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("الكاميرا"),
              onTap: () {
                Navigator.pop(ctx);
                fromCamera();
              },
            ),
          ],
        ),
      ),
    );
  }
}
