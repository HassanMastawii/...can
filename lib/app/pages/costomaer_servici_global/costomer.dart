import 'dart:async';
import 'dart:io'; // استيراد المكتبة المطلوبة
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Costmarglobal extends StatefulWidget {
  const Costmarglobal({Key? key}) : super(key: key);

  @override
  State<Costmarglobal> createState() => _CostmarglobalState();
}

class _CostmarglobalState extends State<Costmarglobal> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  bool includeImage = false;
  DateTime? birthDate;
  List<TextEditingController> imagecontroller = [
    TextEditingController(),
  ];

  // StreamController لإدارة تحميل الصور
  StreamController<File?> imageStreamController = StreamController<File?>();

  void _getImageFromGallery(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagecontroller[index].text = pickedFile.path;
        imageStreamController
            .add(File(pickedFile.path)); // إرسال الصورة للـ StreamController
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('خدمة العملاء'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: descriptionController,
              maxLength: 500,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'تفضل بوصف المشكاكل اللتي تواجهها ',
              ),
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('اضافة صوره اختياريه'),
              value: includeImage,
              onChanged: (value) {
                setState(() {
                  includeImage = value!;
                });
              },
            ),
            if (includeImage)
              StreamBuilder<File?>(
                stream: imageStreamController
                    .stream, // يُعرض الصورة هنا إذا تم تحميلها
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Image.file(snapshot.data!);
                  }
                  return TextButton(
                    onPressed: () {
                      _getImageFromGallery(0); // Pass the appropriate index
                    },
                    child: Text('تحميل الصورة'),
                  );
                },
              ),
            SizedBox(height: 16.0),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText:
                    'اضافة طريقة تواصل معك\n\n  (WhatsApp, Email, Phone)',
              ),
            ),
            SizedBox(height: 170),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement submit functionality
                  String description = descriptionController.text;
                  String contactInfo = contactController.text;
                  // Send the data to your backend or handle it as needed
                },
                child: Text('ارسال'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    imageStreamController
        .close(); // تأكد من إغلاق الـ StreamController عند التخلص من الصفحة
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: Costmarglobal(),
  ));
}
