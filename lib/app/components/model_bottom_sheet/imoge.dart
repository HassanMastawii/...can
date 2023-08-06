import 'package:flutter/material.dart';

class ImogeMic extends StatefulWidget {
  const ImogeMic({super.key});

  @override
  State<ImogeMic> createState() => _ImogeMicState();
}

class _ImogeMicState extends State<ImogeMic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child:  const Center(
              child: Text("ترفيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),),
        ),
        Expanded(
          child: Container(
            color: Colors.black87,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 56,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          child: Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/imoge.png'))),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          "مضحك",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
