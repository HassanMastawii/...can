import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/pages/agency/agencys.dart';
import 'package:flutter/material.dart';

class Lookagency extends StatefulWidget {
  const Lookagency({super.key});

  @override
  State<Lookagency> createState() => _LookagencyState();
}

class _LookagencyState extends State<Lookagency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأنظمام لوكالة'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(width: 1, color: appcolor.agency)),
                    child: const TextField(),
                  ),
                ),
                const Text(
                  'بحث',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 44, top: 55),
              child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: appcolor.agency, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
                                "اسم الوكيل:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              "hassan",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
                                "اسم الوكالة:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              "Canary Chat",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 58, 100)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              'ملاحظة',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
                "في انظمامك الى وكالة ما انت تخلي كامل المسؤليه عن البرنامجعلى ايصال راتبك ويبقى تواصلك مع وكيلك في ذالك"),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 44, top: 55),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Agency(),
                    ));
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        color: appcolor.agency,
                        borderRadius: BorderRadius.circular(33)),
                    child: const Center(
                      child: Text(
                        'أنظمام',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
