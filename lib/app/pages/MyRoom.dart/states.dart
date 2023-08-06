// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.black12,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 30,
            child: const Text(
              "الحالة",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(color: Colors.black, height: 11),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "دردشه",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "قران",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "عشوائي",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ), Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "صداقه",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "شعر",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "رياضه",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ), Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "عيد ميلاد",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "حب",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   decoration: BoxDecoration( color: Colors.black54,
                    borderRadius: BorderRadius.circular(33)),
                    height: 40,
                   
                    child: const Center(
                      child: Text(
                        "غناء",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
