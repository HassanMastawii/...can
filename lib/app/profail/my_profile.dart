import 'package:canary_app/app/components/model_bottom_sheet/lang_sheet.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/profail/agency/monay_home.dart';
import 'package:canary_app/app/profail/costomaer_servici_global/costomer.dart';
import 'package:canary_app/app/profail/family/family_profile.dart';

import 'package:canary_app/app/profail/level/level.dart';
import 'package:canary_app/app/profail/profail/ferind.dart';
import 'package:canary_app/app/profail/profail/folowers.dart';
import 'package:canary_app/app/profail/profail/folowing.dart';
import 'package:canary_app/app/profail/profail/visitors.dart';
import 'package:canary_app/app/profail/store/my_money.dart';
import 'package:canary_app/app/profail/the_shop/home_shop.dart';
import 'package:canary_app/app/profail/vip/vip_home.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/welcome/auth/Login.dart';
import 'package:canary_app/device/locale/locale.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<CoreProvider>(
        builder: (__, value, _) => value.isLoadingProfile
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 75.w,
                            child: CircleAvatar(
                              radius: 73.w,
                              backgroundImage:
                                  const AssetImage("images/pic_room.jpg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
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
                        ),
                      ],
                    ),
                    Text(
                      value.myProfile?.name ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        if (value.myProfile?.id != null) {
                          Clipboard.setData(ClipboardData(
                              text: value.myProfile!.id.toString()));
                          showSnackbar(context, 'تم النسخ بنجاح');
                        }
                      },
                      icon: const Icon(Icons.library_add_rounded),
                      label: Text(value.myProfile?.id?.toString() ?? ""),
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
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const VisitorsPage(),
                              ));
                            },
                            child: const Text("الزوار \n 55")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const FolowerPage(),
                              ));
                            },
                            child: const Text("متابعين \n 55")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const FolowingPage(),
                              ));
                            },
                            child: const Text("أتابعهم \n 55")),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FriendPage(),
                                  ));
                            },
                            child: const Text("أصدقاء \n 55")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Viphome(),
                              ));
                        },
                        child: Container(
                          height: 50.h,
                          width: 360.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
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
                              leading: Icon(Icons.upload,
                                  color: Colors.yellowAccent[700]),
                              title: Text(
                                getText(context, "level"),
                                style: const TextStyle(color: Colors.white),
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
                              title: Text(
                                getText(context, "coins"),
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                value.myProfile?.balance?.toString() ?? "0",
                                style: const TextStyle(color: Colors.white),
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
                              imageLink: "images/s1.png",
                              text: getText(context, "badge"),
                              onTap: () {}),
                          const Spacer(
                            flex: 2,
                          ),
                          getButton(
                              imageLink: "images/f1.png",
                              text: getText(context, "family"),
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
                              imageLink: "images/m1.png",
                              text: getText(context, "store"),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeShop(),
                                ));
                              }),
                          const Spacer(
                            flex: 2,
                          ),
                          getButton(
                              imageLink: "images/d11.png",
                              text: getText(context, "income"),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MonayHome(),
                                ));
                              }),
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
                            ListTile(
                                title: Text(
                                  getText(context, "invitefriends"),
                                ),
                                leading: const Icon(Icons.person_add)),
                            ListTile(
                                title: Text(
                                  getText(context, "settings"),
                                ),
                                leading: const Icon(Icons.settings)),
                            ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Costmarglobal(),
                                      ));
                                },
                                title: Text(
                                  getText(context, "feedback"),
                                ),
                                leading: const Icon(Icons.support_agent)),
                            ListTile(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    builder: (context) => const LangSheet(),
                                  );
                                },
                                title: Text(
                                  getText(context, "applang"),
                                ),
                                leading: const Icon(Icons.language)),
                            ListTile(
                                onTap: () async {
                                  final agreeLogout =
                                      await MySnackBar.showYesNoDialog(context,
                                          "هل تود تسجيل الخروج بالفعل؟");
                                  if (agreeLogout && mounted) {
                                    context.read<CoreProvider>().token = null;
                                    context.read<CoreProvider>().logOut();
                                    MyRouter.myPushReplacmentAll(
                                      context,
                                      const Login(),
                                    );
                                  }
                                },
                                title: Text(
                                  getText(context, "logout"),
                                ),
                                leading: const Icon(Icons.logout)),
                            50.getHightSizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                  text,
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

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );

  // عرض الرسالة لمدة 2 ثانية (يمكنك تغيير القيمة حسب رغبتك)
  Future.delayed(const Duration(seconds: 2), () {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  });
}
