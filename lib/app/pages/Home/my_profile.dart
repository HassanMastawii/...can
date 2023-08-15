import 'package:canary_app/app/pages/profail/ferind.dart';
import 'package:canary_app/app/pages/store/my_money.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../customer_service/customers_service.dart';
import '../family/family_profile.dart';
import '../level/level.dart';
import 'edit_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfail(),
                          ));
                    },
                    icon: const Icon(
                      Icons.edit_note_rounded,
                      size: 50,
                    )),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 75.w,
                  child: CircleAvatar(
                    radius: 73.w,
                    backgroundImage: const AssetImage("images/pic_room.jpg"),
                  ),
                ),
              ],
            ),
            const Text(
              "user name",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.library_add_rounded),
              label: const Text("id:123456789"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getButton(
                  text: "22",
                  imageLink: "images/11.png",
                  width: 60,
                  hieght: 30,
                ),
                getButton(
                  text: "22",
                  imageLink: "images/11.png",
                  width: 60,
                  hieght: 30,
                ),
                getButton(
                  text: "22",
                  imageLink: "images/fam.png",
                  width: 60,
                  hieght: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: const Text("الزوار \n 55")),
                TextButton(
                    onPressed: () {}, child: const Text("متابعين \n 55")),
                TextButton(
                    onPressed: () {}, child: const Text("أتابعهم \n 55")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Ferind(),
                          ));
                    },
                    child: const Text("أصدقاء \n 55")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(child: Image.asset('images/vip.png')),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.brown,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LevelPage(),
                        ));
                      },
                      leading:
                          Icon(Icons.upload, color: Colors.yellowAccent[700]),
                      title: const Text(
                        "المستوى",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(
                        "22",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.purple,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyMoney(),
                            ));
                      },
                      leading: Icon(Icons.monetization_on,
                          color: Colors.yellowAccent[700]),
                      title: const Text(
                        "الشحن",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(
                        "567954321564",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  getButton(
                      imageLink: "images/s1.png", text: "الشارة", onTap: () {}),
                  const Spacer(
                    flex: 2,
                  ),
                  getButton(
                      imageLink: "images/f1.png",
                      text: "العائلة",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FamilyProfile(),
                        ));
                      }),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  getButton(
                      imageLink: "images/m1.png", text: "المتجر", onTap: () {}),
                  const Spacer(
                    flex: 2,
                  ),
                  getButton(
                      imageLink: "images/d11.png", text: "الدخل", onTap: () {}),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )),
                child: Column(
                  children: [
                    const ListTile(
                        title: Text("دعوة الأصدقاء"),
                        leading: Icon(Icons.person_add)),
                    const ListTile(
                        title: Text("الأعدادات"),
                        leading: Icon(Icons.settings)),
                    ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CustomersService(),
                              ));
                        },
                        title: const Text("المساعدة وردود الفعل"),
                        leading: const Icon(Icons.support_agent)),
                    50.getHightSizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getButton({
    void Function()? onTap,
    required String text,
    required String imageLink,
    double hieght = 50,
    double width = 125,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: hieght,
        width: width,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageLink), fit: BoxFit.fill),
          borderRadius: const BorderRadius.all(
            Radius.circular(11),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "\t\t\t\t\t$text",
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
