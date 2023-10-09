import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SuperChatinroom extends StatefulWidget {
  const SuperChatinroom({super.key});

  @override
  State<SuperChatinroom> createState() => _SuperChatinroomState();
}

class _SuperChatinroomState extends State<SuperChatinroom> {
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
                child:  Text(
              "Supur Chat",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
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
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  texttaim(name: "500", taim: "30ثانيه"),
                  texttaim(name: "999", taim: "45ثانيه"),
                  texttaim(name: "1999", taim: "60ثانيه"),
                  texttaim(name: "4999", taim: "180ثانيه"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.lightBlue[200],
              ),
              child: MyButton(
                text: "ارسال",
                color: Colors.lightBlue[200],
                fontColor: Colors.black,
                
              ),
            ),
          )
        ],
      ),
    );
  }
}

texttaim({
  required String name,
  required String taim,
  void Function()? ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Column(
      children: [
        Text(
          name,
          style: TextStyle(
              color: Colors.amber[900],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          taim,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
