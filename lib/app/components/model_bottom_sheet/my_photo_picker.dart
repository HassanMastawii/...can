import 'dart:io';
import 'dart:math';

import 'package:image/image.dart' as Im;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class MyPhotoPicker {
  final ImagePicker picker = ImagePicker();
  String? path;
  Future<String> jpgTOpng(path) async {
    File imagePath = File(path);
    //get temporary directory
    final tempDir = await getTemporaryDirectory();
    int rand = Random().nextInt(10000);
    //reading jpg image
    Im.Image image = Im.decodeImage(imagePath.readAsBytesSync())!;
    //decreasing the size of image- optional
    // Im.Image smallerImage = Im.copyResize(image, width: 800);
    //get converting and saving in file
    File compressedImage = File('${tempDir.path}/img_$rand.png')
      ..writeAsBytesSync(Im.encodePng(image, level: 8));

    return compressedImage.path;
  }

  Future<String?> fromGallery() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      path = await imageCroper(value?.path);
    });
    if (path != null) {
      path = await jpgTOpng(path);
    }
    return path;
  }

  Future<String?> fromCamera() async {
    await picker.pickImage(source: ImageSource.camera).then((value) async {
      path = await imageCroper(value?.path);
    });
    if (path != null) {
      path = await jpgTOpng(path);
    }
    return path;
  }

  Future<String?> imageCroper(String? path) async {
    if (path == null) {
      return path;
    } else {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: path,
          maxHeight: 500,
          maxWidth: 500,
          aspectRatio: const CropAspectRatio(ratioX: 500, ratioY: 500),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              // toolbarColor: Theme.of(context).scaffoldBackgroundColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true,
              // statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ]);
      return croppedFile?.path;
    }
  }
}
