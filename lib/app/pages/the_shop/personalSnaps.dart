// ignore_for_file: file_names
import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class Personalsnaps extends StatefulWidget {
  const Personalsnaps({super.key});

  @override
  State<Personalsnaps> createState() => _PersonalsnapsState();
}

class _PersonalsnapsState extends State<Personalsnaps> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  color: appcolor.shopcontenaer,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      children: const [
                        Text("data"),
                        Spacer(),
                        Icon(Icons.access_time_filled),
                        Text("15day")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset('images/shop/personalsnaps/love.png'),
                  ),
                  Text(
                    'The Love',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[400]),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.amberAccent, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: GestureDetector(onTap: () {
                        //الذهاب لقائمة الاصدقاء واختيار الصديق وارسار الميزه له
                      },
                        child: const Text(
                          "اهداء",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]);
  }
}
