// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bacpicroom extends StatefulWidget {
  const Bacpicroom({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BacpicroomState createState() => _BacpicroomState();
}

class _BacpicroomState extends State<Bacpicroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          children: [
            SizedBox(
              height: 33.h,
            ),
            const Divider(
              color: Colors.black,
              height: 11,
            ),
            Container(
              width: double.infinity,
              height: 646.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 22,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/th1.jpeg"))),
                      width: double.infinity,
                      height: 500.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(11),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(22)),
                                  child: const Text(
                                    "شراء الخلفيه",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
