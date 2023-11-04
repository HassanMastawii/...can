import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';

class StardomContent extends StatefulWidget {
  const StardomContent({super.key});

  @override
  State<StardomContent> createState() => _StardomContentState();
}

class _StardomContentState extends State<StardomContent> {
  @override
  Widget build(BuildContext context) {
    //جعل هاذه الصفحه كلها تعمل سكرل فيو
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: agency,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black)),
              child: const Text("العلاقات الاجتماعيه")),
          const Divider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.7),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.black26,
                );
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: agency,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black)),
              child: const Text("التسجيل الصوتي")),
        ],
      ),
    );
  }
}
