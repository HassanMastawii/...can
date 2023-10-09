import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardAdmin extends StatefulWidget {
  const CardAdmin({
    super.key,
    required this.v,
  });

  final String v;

  @override
  State<CardAdmin> createState() => _CardAdminState();
}

class _CardAdminState extends State<CardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(33)),
                  child: Center(
                    child: Text(
                      widget.v,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("user name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Text("ID:45678980"),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 11),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: const Color.fromARGB(207, 255, 224, 85)),
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.black,
                        image: const DecorationImage(
                            image: AssetImage('images/pic_room.jpg'))),
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
