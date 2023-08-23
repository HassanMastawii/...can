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
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'شحن الرصيد',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                ),
              ),
              Text('لشحن الرصيد ضع رقم IDهنا',style: TextStyle(fontSize: 16,),),
              MyTextField(maxLines: 1,),
              
              Center(child: MyButton(text: 'ارسال'))
            ],
          ),
        ),
      ),
    );
  }
}
