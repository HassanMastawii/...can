import 'package:canary_app/app/pages/profail/finash_myphoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangMyPhoto extends StatefulWidget {
  const ChangMyPhoto({super.key});

  @override
  State<ChangMyPhoto> createState() => _ChangMyPhotoState();
}

class _ChangMyPhotoState extends State<ChangMyPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 202, 249, 1),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                child: Container(
                  height: 33.h,
                  width: 200.w,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(11)),
                width: double.infinity,
                height: 300.h,
                child: const Column(
                  children: [
                    Text(
                      "يرجى الانتباه قبل تغير الصوره ان هذه الصور لا تمر من قبل المراجعه ",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const FinashMyPhoto();
                        });
                  },
                  child: Container(
                    height: 33.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.blueAccent[700],
                    ),
                    child: const Center(
                        child: Text(
                      "التالي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
