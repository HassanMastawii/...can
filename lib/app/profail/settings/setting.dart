import 'package:canary_app/app/components/toast.dart';

import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/welcome/auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String selectedLanguage = 'العربية';
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('الاعدادات')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'لغة التطبيق',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('اختر لغة التطبيق:'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RadioListTile(
                                      title: const Text('العربية'),
                                      value: 'العربية',
                                      groupValue: selectedLanguage,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLanguage = value!;
                                          Navigator.pop(
                                              context); // إغلاق الحوار بعد الاختيار
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text('English'),
                                      value: 'English',
                                      groupValue: selectedLanguage,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLanguage = value!;
                                          Navigator.pop(
                                              context); // إغلاق الحوار بعد الاختيار
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          selectedLanguage,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'الحساب والحمايه',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'اذن الاشعارات',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Switch(
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'سياسة الخصوصيه',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'اتفاقية المستخدمين',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'المساعده والدعم',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () async {
                  final agreeLogout = await MySnackBar.showYesNoDialog(
                      context, "هل تود تسجيل الخروج بالفعل؟");
                  if (agreeLogout && mounted) {
                    context.read<CoreProvider>().token = null;
                    context.read<CoreProvider>().logOut();
                    MyRouter.myPushReplacmentAll(
                      context,
                      const Login(),
                    );
                  }
                },
                title: const Text(
                  'تسجيل خروج',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(),
            ],
          ),
        ));
  }
}
