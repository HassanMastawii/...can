import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';
import '../../widgets/my_text_field.dart';

class CreateFamily extends StatelessWidget {
  const CreateFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: OverflowBox(
                maxHeight: MediaQuery.of(context).size.height,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'images/create_family_background.png'
                      : 'images/create_family_background.png',
                  repeat: ImageRepeat.repeat,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            ListView(
              children: [
                100.getHightSizedBox(),
                Column(
                  children: [
                    const Text(
                      "إنشاء عائلة",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.yellow, width: 5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.getHightSizedBox(),
                              Row(
                                children: const [
                                  Text("اسم العائلة : "),
                                  Expanded(
                                    child: MyTextField(),
                                  ),
                                ],
                              ),
                              20.getHightSizedBox(),
                              const Text(
                                "نبذة تعريفية عن العائلة : ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              20.getHightSizedBox(),
                              const MyTextField(
                                minLines: 2,
                                maxLines: 3,
                              ),
                              20.getHightSizedBox(),
                              const Text(
                                "سوف يتم خصم 25 ألف من الذهب لإنشاء العائلة الخاصة بك.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              20.getHightSizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber)),
                      onPressed: () {},
                      child: const Text(
                        "اضغط للإنشاء",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
