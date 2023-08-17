import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Kisalhath extends StatefulWidget {
  const Kisalhath({super.key});

  @override
  State<Kisalhath> createState() => _KisalhathState();
}

class _KisalhathState extends State<Kisalhath> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(11)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[200],
                    image: const DecorationImage(
                      image: AssetImage(
                        "images/exstra/k1.png",
                      ),
                    )),
                height: 100,
                width: 100,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "كيس الحظ العالمي",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(22)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
            MyButton(onPressed: () {
              
            },
            color: Colors.amber[300],
            fontColor: Colors.black,
            
              text: "كيس الحظ"),
                MyButton(onPressed: () {
              
            },
            color: Colors.amber[300],
            fontColor: Colors.black,
            
              text: " كيس الحظ الدولي"),
              
              
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 4),
             child: Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(22)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  const [
             
                
                ],
              ),
                     ), 
           ),
        ],
      ),
    );
  }
}
