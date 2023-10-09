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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('تأكيد الخروج من الوكالة'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'تاكيد',
                              style: TextStyle(fontSize: 20),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'اغلاق',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  "الخروج من الوكالة",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 44, top: 11),
                child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(color: agency, width: 1),
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
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
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.library_add_rounded),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
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
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.library_add_rounded),
                                ),
                              ],
                            ),
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
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: agency, width: 1),
                        borderRadius: BorderRadius.circular(18)),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('ساعات'),
                                Spacer(),
                                Text('60'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('ايام'),
                                Spacer(),
                                Text('60'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('دخل الذهب'),
                                Spacer(),
                                Text('60'),
                              ],
                            ),
                          ],
                        ))),
              ),
              const Text(
                'سجل الارباح لثلاث اشهر ماضيه',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44, top: 11),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      border: Border.all(color: agency, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('ساعات'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('ايام'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('دخل الذهب'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                            Divider(),
                            Text('60'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
