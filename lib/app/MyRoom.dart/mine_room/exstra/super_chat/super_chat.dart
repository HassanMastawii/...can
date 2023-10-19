import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperChatinroom extends StatefulWidget {
  const SuperChatinroom({Key? key}) : super(key: key);

  @override
  State<SuperChatinroom> createState() => _SuperChatinroomState();
}

class _SuperChatinroomState extends State<SuperChatinroom> {
  String selectedNumber = "";
  bool isSendButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.lightBlue[200],
            ),
            child: const Center(
              child: Text(
                "Supur Chat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("تميز برسائلك \n اكتب رسالتك هنا من 60 حرفا"),
            ],
          ),
          const Card(
            elevation: 11,
            child: MyTextField(maxLines: 2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  texttaim(
                    name: "500",
                    taim: "30ثانيه",
                    isSelected: selectedNumber == "30ثانيه",
                    onTap: () {
                      setState(() {
                        selectedNumber = "30ثانيه";
                        isSendButtonEnabled = true;
                      });
                    },
                  ),
                  texttaim(
                    name: "999",
                    taim: "45ثانيه",
                    isSelected: selectedNumber == "45ثانيه",
                    onTap: () {
                      setState(() {
                        selectedNumber = "45ثانيه";
                        isSendButtonEnabled = true;
                      });
                    },
                  ),
                  texttaim(
                    name: "1999",
                    taim: "60ثانيه",
                    isSelected: selectedNumber == "60ثانيه",
                    onTap: () {
                      setState(() {
                        selectedNumber = "60ثانيه";
                        isSendButtonEnabled = true;
                      });
                    },
                  ),
                  texttaim(
                    name: "4999",
                    taim: "180ثانيه",
                    isSelected: selectedNumber == "180ثانيه",
                    onTap: () {
                      setState(() {
                        selectedNumber = "180ثانيه";
                        isSendButtonEnabled = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          MyButton(
            onPressed: isSendButtonEnabled ? () {} : null,
            text: "ارسال",
            color: Colors.lightBlue[200],
            fontColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

Widget texttaim({
  required String name,
  required String taim,
  bool isSelected = false,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: isSelected ? Border.all(color: Colors.red, width: 1) : null,
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.amber[900],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            taim,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
