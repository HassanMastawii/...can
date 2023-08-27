import 'package:canary_app/app/widgets/my_text_button.dart';
import 'package:flutter/material.dart';

// class AccountCard extends StatelessWidget {
//   const AccountCard({super.key, this.trailing});
//   final Widget? trailing;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundColor: Colors.amber,
//           radius: 35,
//           child: CircleAvatar(
//             radius: 25,
//             backgroundImage: AssetImage("images/pic_room.jpg"),
//           ),
//         ),
//         title: Column(
//           children: [
//             const Text("محمد علي كلاي", style: TextStyle(fontSize: 20)),
//             InkWell(
//                 child: const Text("محمد علي كلاي",
//                     style: TextStyle(fontSize: 20))),
//           ],
//         ),
//         trailing: trailing ??
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.add_comment_rounded)),
//         subtitle: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             getButton(
//               text: "22",
//               imageLink: "images/11.png",
//               width: 50,
//               hieght: 30,
//             ),
//             getButton(
//               text: "22",
//               imageLink: "images/to.png",
//               width: 50,
//               hieght: 50,
//             ),
//             getButton(
//               text: "22",
//               imageLink: "images/fam.png",
//               width: 50,
//               hieght: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

getButton({
  void Function()? onTap,
  required String text,
  required String imageLink,
  double hieght = 50,
  double width = 125,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: InkWell(
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
              child: Text(
                text,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
