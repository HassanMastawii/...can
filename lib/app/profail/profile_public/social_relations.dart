import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialRelationsContent extends StatefulWidget {
  const SocialRelationsContent({super.key});

  @override
  State<SocialRelationsContent> createState() => _SocialRelationsContentState();
}

class _SocialRelationsContentState extends State<SocialRelationsContent> {
  @override
  Widget build(BuildContext context) {
    //جعل هاذه الصفحه كلها تعمل سكرل فيو
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: agency,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black)),
              child: const Text("الهدايا المستلمة")),
          //جعل بين القريد فيو واللي فوقها واللي تحتها مجال بمقدار 6 بكسل
          Expanded(
            child: Container(
              color: Colors.black87,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 59.h,
                                    width: 59.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/sy.png'))),
                                  ),
                                ],
                              ),
                              const Text(
                                "name geft",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "2000",
                            style: TextStyle(
                              color: Colors.amberAccent,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: agency,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Text("البلد"),
                    Text("مصر"),
                  ],
                ),
                Row(
                  children: [
                    Text("تاريخ الميلاد"),
                    Text("1/1/2000"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
