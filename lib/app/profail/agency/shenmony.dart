import 'package:canary_app/app/colorApp/color.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Shenmony extends StatefulWidget {
  const Shenmony({super.key});

  @override
  State<Shenmony> createState() => _ShenmonyState();
}

class _ShenmonyState extends State<Shenmony> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'شحن الرصيد',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'لشحن الرصيد ضع رقم IDهنا',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              MyTextField(
                maxLines: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text("ضع هنا كم دولار"),
              ),
              MyTextField(
                maxLines: 1,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 30),
                child: Center(
                    child: MyButton(
                        color: agency, fontColor: Colors.black, text: 'ارسال')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
