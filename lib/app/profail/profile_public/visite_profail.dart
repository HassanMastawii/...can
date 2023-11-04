import 'package:canary_app/app/MyRoom.dart/praicroom/cart_users.dart';
import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/profail/profile_public/social_relations.dart';
import 'package:canary_app/app/profail/profile_public/stardom_content.dart';
import 'package:canary_app/app/profail/profile_public/slidephoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VisiteProfail extends StatefulWidget {
  const VisiteProfail({super.key});

  @override
  State<VisiteProfail> createState() => _VisiteProfailState();
}

class _VisiteProfailState extends State<VisiteProfail> {
  final PageController _pageController =
      PageController(initialPage: 0); // تحديد الصفحة الافتراضية
  int _currentPage = 0;

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 265,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 65),
                  child: SizedBox(
                    height: 200,
                    child: Slaidphoto(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(isOnline
                                    ? 'موجود في غرفة hassan'
                                    : 'مستخدم غير متصل'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'متابعه',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'تراجع',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          isOnline
                              ? Icons.arrow_outward_sharp
                              : Icons.arrow_outward_sharp,
                          size: 33,
                          color: isOnline
                              ? Colors.blue
                              : Colors.black, // تغيير لون الرمز
                        ),
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("images/2.png"),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'block') {
                          } else if (value == 'report') {}
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem<String>(
                              value: 'block',
                              child: Text('حظر المستخدم'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'report',
                              child: Text('الإبلاغ عن المستخدم'),
                            ),
                          ];
                        },
                        child: const Icon(
                          Icons.admin_panel_settings_rounded,
                          size: 33,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("user name ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                const Text(
                  "50",
                  style: TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "المتابعين",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Spacer(),
                const Text("15447454"),
                const Text(" :ID "),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: "15447454"));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("تم نسخ الرقم بنجاح"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.library_add_rounded))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getButton(
                  text: "22",
                  imageLink: "images/11.png",
                  width: 50,
                  hieght: 30,
                ),
                getButton(
                  text: "22",
                  imageLink: "images/to.png",
                  width: 50,
                  hieght: 50,
                ),
                getButton(
                  text: "22",
                  imageLink: "images/fam.png",
                  width: 50,
                  hieght: 30,
                ),
                getButton(
                  text: "22",
                  imageLink: "images/fam.png",
                  width: 50,
                  hieght: 30,
                ),
              ],
            ),
          ),
          const Text("لا اله الا الله محمد رسول الله "),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[50]),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        _navigateToPage(0); // الانتقال إلى صفحة النجومية
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        height: 70,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == 0 ? agency : Colors.orange[100],
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(child: Text("الملف الشخصي")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        _navigateToPage(1); // الانتقال إلى صفحة النجومية
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        height: 70,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == 1 ? agency : Colors.orange[100],
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(child: Text("النجومية")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                StardomContent(),
                SocialRelationsContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
