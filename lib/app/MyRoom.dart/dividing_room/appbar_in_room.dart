// import 'package:canary_app/app/pages/MyRoom.dart/editroom/edit_room.dart';
// import 'package:canary_app/app/pages/MyRoom.dart/peopleinroom.dart';
// import 'package:canary_app/app/router/my_router.dart';
// import 'package:canary_app/data/datasources/remote_database/links.dart';
// import 'package:canary_app/domain/models/room.dart';
// import 'package:flutter/material.dart';

// class AppbarInRoom extends StatefulWidget {
//   const AppbarInRoom({super.key, this.room});
//   final Room? room;
//   @override
//   State<AppbarInRoom> createState() => _AppbarInRoomState();
// }

// class _AppbarInRoomState extends State<AppbarInRoom> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.power_settings_new,
//           ),
//         ),
//         Expanded(
//           child: ListTile(
//             leading: GestureDetector(
//               onTap: () async {
//                 await MyRouter.myPush(
//                   context,
//                   Editroom(room: widget.room!),
//                 ).then((value) {
//                   setState(() {
//                     print("done");
//                   });
//                 });
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.amber,
//                 radius: 25,
//                 child: CircleAvatar(
//                   radius: 24,
//                   backgroundImage:
//                       NetworkImage("$serverLink${widget.room?.pic}"),
//                 ),
//                 // CircleAvatar(
//                 //   radius: 24,
//                 //   backgroundImage:
//                 //       AssetImage("images/pic_room.jpg"),
//                 // ),
//               ),
//             ),
//             subtitle: Text(
//               "ID:${widget.room?.roomId}",
//               style: const TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//             title: Text(
//               widget.room?.name ?? "",
//               style: const TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ),
//         TextButton.icon(
//             style:
//                 const ButtonStyle(side: MaterialStatePropertyAll(BorderSide())),
//             onPressed: () {
//               showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return const PeopleinRoom();
//                   });
//             },
//             icon: const Icon(Icons.group),
//             label: const Text("1000")),
//       ],
//     );
//   }
// }
