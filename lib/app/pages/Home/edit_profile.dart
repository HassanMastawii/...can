import 'package:canary_app/app/pages/Home/record_page.dart';
import 'package:canary_app/app/pages/profail/chang_myphoto.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_form_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/image_picker_mobile.dart';

class EditProfail extends StatefulWidget {
  const EditProfail({super.key});

  @override
  State<EditProfail> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfail> {
  final TextEditingController username = TextEditingController();
  DateTime? birthDate;
  List<TextEditingController> imagecontroller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(144, 202, 249, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 40,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.blueAccent[700],
                ),
                child: const Center(
                    child: Text(
                  "تحرير المعلومات الشخصيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Stack(alignment: Alignment.bottomLeft, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ChangMyPhoto();
                        });
                  },
                  child: Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: const Color.fromARGB(207, 255, 224, 85)),
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.black,
                        image: const DecorationImage(
                            image: AssetImage('images/pic_room.jpg'))),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
              ),
            ]),
            const Divider(
              height: 6,
              color: Colors.black,
            ),
            Center(
              child: Container(
                height: 33.h,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.blueAccent[700],
                ),
                child: const Center(
                    child: Text(
                  "اضافة صور",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 140.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImagePickerMobile(
                        imageController: imagecontroller[index], radius: 50),
                  );
                },
              ),
            ),
            const Divider(
              height: 6,
              color: Colors.black,
            ),
            MyButton(
              text: "المعلومات الاساسيه",
              color: Colors.blueAccent[700],
              fontColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: Colors.black12,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextFormField(
                        labelText: "الاسم :",
                        color: const Color.fromRGBO(144, 202, 249, 1),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(144, 202, 249, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<int>(
                        dropdownColor: const Color.fromRGBO(144, 202, 249, 1),
                        value: gender,
                        padding: const EdgeInsets.all(5),
                        items: const [
                          DropdownMenuItem(value: 0, child: Text("ذكر")),
                          DropdownMenuItem(value: 1, child: Text("أنثى")),
                        ],
                        underline: const SizedBox.shrink(),
                        hint: const Text("الجنس"),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                          color: const Color.fromRGBO(144, 202, 249, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text("birth date : "),
                                const SizedBox(width: 5),
                                Expanded(
                                    child: Text(
                                        birthDate?.toString().split(" ")[0] ??
                                            "")),
                                const SizedBox(width: 5),
                                IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2002),
                                      firstDate: DateTime(1930),
                                      lastDate: DateTime.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          birthDate = value;
                                        });
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.date_range),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        color: const Color.fromRGBO(144, 202, 249, 1),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("البلد : "),
                              ),
                            ),
                            CountryCodePicker(
                              showCountryOnly: true,
                              initialSelection: context
                                  .watch<CoreProvider>()
                                  .myProfile
                                  ?.contry,
                              showDropDownButton: true,
                              countryFilter: codes
                                  .map((e) => e["code"].toString())
                                  .toList()
                                ..removeWhere((element) => element == "IL"),
                              onChanged: (value) {
                                print(value.code);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextFormField(
                        labelText: " نبذة مختصرة :",
                        color: const Color.fromRGBO(144, 202, 249, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                text: "تسجيل صوتي",
                color: Colors.blueAccent[700],
                fontColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecordPage(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
