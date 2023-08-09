// // ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

// import 'package:canary_app/Home/Home.dart';
// import 'package:canary_app/MyRoom.dart/edit_room.dart';
// import 'package:canary_app/MyRoom.dart/peopleinroom.dart';
// import 'package:canary_app/MyRoom.dart/praicroom.dart';
// import 'package:canary_app/massge/Masseg.dart';
// import 'package:canary_app/min_baer/exstra/exstra.dart';
// import 'package:canary_app/min_baer/geft.dart';
// import 'package:canary_app/min_baer/imoge.dart';
// import 'package:canary_app/min_baer/thetext.dart';
// import 'package:canary_app/profail/show_profail_frend.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class MyRoom extends StatefulWidget {
//   const MyRoom({super.key});

//   @override
//   State<MyRoom> createState() => _MyRoomState();
// }

// class _MyRoomState extends State<MyRoom> {
//   @override
//   Widget build(BuildContext context) {
//     SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
//         statusBarBrightness: Brightness.dark,
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.transparent,
//         systemNavigationBarDividerColor: Colors.transparent,
//         systemStatusBarContrastEnforced: false,
//         systemNavigationBarContrastEnforced: false,
//         systemNavigationBarIconBrightness: Brightness.dark);
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

//     return Scaffold(
//       body: Container(
//         color: Colors.black38,
//         width: double.infinity,
//         // decoration: const BoxDecoration(
//         //     image: DecorationImage(
//         //         fit: BoxFit.fill, image: AssetImage("images/th1.jpeg"))),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 22,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     child: IconButton(
//                         onPressed: () {
//                           Get.to(const Home());
//                         },
//                         icon: const Icon(
//                           Icons.power_settings_new,
//                           color: Colors.white,
//                         )),
//                   ),
//                   const Spacer(),
//                   Container(
//                     child: InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return const PeopleinRoom();
//                             });
//                       },
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.people_alt_outlined,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             '1000',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 33,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(45),
//                       border: Border.all(
//                         width: 2,
//                         color: const Color.fromARGB(207, 255, 224, 85),
//                       ),
//                     ),
//                     child: Column(
//                       children: const [
//                         Text(
//                           'canary chat',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "ID:2334424",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(const Editroom());
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Container(
//                         width: 53.w,
//                         height: 53.h,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(45),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 200,
//             ),
//             Container(
//               width: double.infinity,
//               height: 106.h,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 11, top: 6),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // Get.to(const Praicroom());
//                             showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return const Praicroom();
//                                 });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 11),
//                             height: 40.h,
//                             decoration: BoxDecoration(
//                               color: Colors.black26,
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 width: 2,
//                                 color: const Color.fromARGB(207, 255, 224, 85),
//                               ),
//                             ),
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.paid_outlined,
//                                   size: 30,
//                                   color: Colors.yellowAccent,
//                                 ),
//                                 Text(
//                                   '1000',
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 80.w,
//                           height: 80.h,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 4,
//                                   color:
//                                       const Color.fromARGB(207, 255, 224, 85)),
//                               borderRadius: BorderRadius.circular(90),
//                               color: Colors.black,
//                               image: const DecorationImage(
//                                   image: AssetImage('images/pic_room.jpg'))),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(5.0),
//                           child: Text(
//                             'canary chat',
//                             style: TextStyle(fontSize: 16, color: Colors.white),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 85.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '1',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '2',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '3',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '4',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 85.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '5',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '6',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '7',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color: const Color.fromARGB(207, 255, 224, 85)),
//                             borderRadius: BorderRadius.circular(90),
//                             color: Colors.black,
//                             image: const DecorationImage(
//                                 image: AssetImage('images/pic_room.jpg'))),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           '8',
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 11),
//               child: Container(
//                 width: double.infinity,
//                 height: 230.h,
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return const ShowProfailFrendInRoom();
//                             });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: const [
//                                 Text(
//                                   'uesr name',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                                 Text(
//                                   'massege from uesr',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 11),
//                               child: Container(
//                                 width: 60.w,
//                                 height: 60.h,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 4,
//                                         color: const Color.fromARGB(
//                                             207, 255, 224, 85)),
//                                     borderRadius: BorderRadius.circular(90),
//                                     color: Colors.black,
//                                     image: const DecorationImage(
//                                         image:
//                                             AssetImage('images/pic_room.jpg'))),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: const [
//                               Text(
//                                 'uesr name',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22,
//                                 ),
//                               ),
//                               Text(
//                                 'massege from uesr',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 11),
//                             child: Container(
//                               width: 60.w,
//                               height: 60.h,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 4,
//                                       color: const Color.fromARGB(
//                                           207, 255, 224, 85)),
//                                   borderRadius: BorderRadius.circular(90),
//                                   color: Colors.black,
//                                   image: const DecorationImage(
//                                       image:
//                                           AssetImage('images/pic_room.jpg'))),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Stack(alignment: Alignment.topCenter, children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 11, right: 11),
//                 child: Container(
//                   width: double.infinity,
//                   height: 84.h,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 28.h,
//                       ),
//                       Container(
//                         height: 55.h,
//                         decoration: BoxDecoration(
//                             color: Colors.black87,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                                 color: Colors.amberAccent, width: 2)),
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return const Exstra();
//                                       });
//                                 },
//                                 icon: const Icon(
//                                   Icons.now_widgets_outlined,
//                                   color: Colors.amber,
//                                   size: 35,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   color: Colors.amber,
//                                   Icons.volume_up,
//                                   size: 35,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.settings_voice,
//                                   color: Colors.amber,
//                                   size: 35,
//                                 )),
//                             const Spacer(
//                               flex: 2,
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(66)),
//                                             height: 280.h,
//                                             width: double.infinity,
//                                             child: const ImogeMic());
//                                       });
//                                 },
//                                 icon: const Icon(
//                                   Icons.mood,
//                                   color: Colors.amber,
//                                   size: 35,
//                                 )),
//                             IconButton(
//                                 onPressed: () {
//                                    showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return Container(
//                                           height: 700,
//                                           child: const Masseg());
//                                       });
//                                 },
//                                 icon: const Icon(
//                                   Icons.mail,
//                                   color: Colors.amber,
//                                   size: 35,
//                                 )),
//                             IconButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return Container(
//                                         height: 70.h,
//                                           child: const TheText());
//                                       });
//                                 },
//                                 icon: const Icon(
//                                   Icons.comment_outlined,
//                                   color: Colors.amber,
//                                   size: 35,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(66)),
//                             height: 280.h,
//                             width: double.infinity,
//                             child: const Geftbox());
//                       });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 11),
//                   child: Container(
//                     width: 85.w,
//                     height: 85.h,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("images/geftbox.png"))),
//                   ),
//                 ),
//               ),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
