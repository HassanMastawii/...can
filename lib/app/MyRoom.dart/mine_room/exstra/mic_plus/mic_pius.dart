// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MicPlus extends StatefulWidget {
  const MicPlus({super.key});

  @override
  State<MicPlus> createState() => _MicPlusState();
}

class _MicPlusState extends State<MicPlus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "المقعد الاضافي",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            git(
              namberday: "7 day",
              imag: "images/exstra/k1.png",
              praic: "10800",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("تأكيد الشراء"),
                    content: Text("هل أنت متأكد من رغبتك في شراء هذا المقعد",
                        style: TextStyle(color: Colors.blue)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("نعم"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("لا", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
            git(
              namberday: "30 day",
              imag: "images/exstra/k1.png",
              praic: "45800",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("تأكيد الشراء"),
                    content: Text("هل أنت متأكد من رغبتك في شراء هذا المقعد",
                        style: TextStyle(color: Colors.blue)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("نعم"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("لا", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            git(
              namberday: "90 day",
              imag: "images/exstra/k1.png",
              praic: "95800",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("تأكيد الشراء"),
                    content: Text("هل أنت متأكد من رغبتك في شراء هذا المقعد",
                        style: TextStyle(color: Colors.blue)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("نعم"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("لا", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
            git(
              namberday: "180 day",
              imag: "images/exstra/k1.png",
              praic: "258800",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("تأكيد الشراء"),
                    content: Text("هل أنت متأكد من رغبتك في شراء هذا المقعد",
                        style: TextStyle(color: Colors.blue)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("نعم"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("لا", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  git({
    required String namberday,
    required String praic,
    required String imag,
    void Function()? ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                elevation: 11,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imag),
                    ),
                  ),
                ),
              ),
              Text(
                praic,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            namberday,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue[700]),
          ),
        ],
      ),
    );
  }
}
