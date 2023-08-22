import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class Agency extends StatefulWidget {
  const Agency({super.key});

  @override
  State<Agency> createState() => _AgencyState();
}

class _AgencyState extends State<Agency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الوكالة"),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "الخروج من الوكالة",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 44, top: 11),
              child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: appcolor.agency, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
                                "اسم الوكيل:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text(
                                "hassan",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                            const Text('ID:12345'),
                            IconButton(onPressed: () {
                              
                            },
                            icon: const Icon(Icons.library_add_rounded),
                            ),
                            
                          ],
                        ),
                         Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
                                "اسم الوكالة:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text(
                                "Canary Chat",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 58, 100)),
                              ),
                            ),
                             const Text('ID:12345'),
                            IconButton(onPressed: () {
                              
                            },
                            icon: const Icon(Icons.library_add_rounded),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            const Text(
              'احصائيات الارباح',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 44, top: 11),
              child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: appcolor.agency, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column()
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
