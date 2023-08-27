import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/pages/agency/look_agency.dart';
import 'package:canary_app/app/pages/agency/shenmony.dart';
import 'package:canary_app/app/pages/agency/shepmony.dart';
import 'package:flutter/material.dart';

class MonayHome extends StatefulWidget {
  const MonayHome({super.key});

  @override
  State<MonayHome> createState() => _MonayHomeState();
}

class _MonayHomeState extends State<MonayHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'الدخل',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 9, 32, 161)),
        )),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Lookagency(),
                ));
              },
              child: const Text(
                'الأنظمام لوكالة>>>',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'الرصيد',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: agency, borderRadius: BorderRadius.circular(33)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "000",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.amberAccent[400],
                      size: 33,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 33),
              child: Text(
                'ملاحظات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
                'ان دخل المضيفين يتحول على الفور الى \nمايعادل قيمتة من الدولار \n\nومن الخيارات تحت يمكنك شحن الرصيد لاحد اصدقائك او يمكنك سحب الريد اليك \nعندما يصل مقدار رصيدك الى 100دولار \nيتم خصم اجور التحويل من مبلغك حسب بلد تواجدك \nكلما كان المبلغ اكبر كان اجور التحويل اقل'),
            Padding(
              padding: const EdgeInsets.only(bottom: 44, top: 55),
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: agency, borderRadius: BorderRadius.circular(33)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Shepmony();
                            },
                          );
                        },
                        child: const Text(
                          'سحب الرصيد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Shenmony();
                            },
                          );
                        },
                        child: const Text(
                          'شحن الرصيد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
