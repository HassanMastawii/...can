import 'package:canary_app/app/pages/profail/chang_myphoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfail extends StatefulWidget {
  const EditProfail({super.key});

  @override
  State<EditProfail> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      height: 140,
                      width: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                size: 33,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 33,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
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
                  "المعلومات الاساسيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.black38,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 200,
                            height: 33,
                            child: TextField(
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(33))),
                                  hintTextDirection: TextDirection.ltr,
                                  fillColor: Colors.amber,
                                  focusColor: Colors.amber,
                                  helperStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hoverColor: Colors.blueGrey,
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                          Text(
                            ":الاسم",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 200,
                            height: 33,
                            child: TextField(
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(33))),
                                  hintTextDirection: TextDirection.ltr,
                                  fillColor: Colors.amber,
                                  focusColor: Colors.amber,
                                  helperStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hoverColor: Colors.blueGrey,
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                          Text(
                            ":البلد",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 200,
                            height: 33,
                            child: TextField(
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(33))),
                                  hintTextDirection: TextDirection.ltr,
                                  fillColor: Colors.amber,
                                  focusColor: Colors.amber,
                                  helperStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hoverColor: Colors.blueGrey,
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                          Text(
                            ":تاريخ الميلاد",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 200,
                            height: 33,
                            child: TextField(
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(33))),
                                  hintTextDirection: TextDirection.ltr,
                                  helperStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  hoverColor: Colors.amber,
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                          Text(
                            ":نبذه مختصره",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                  "تسجيل صوتي ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
