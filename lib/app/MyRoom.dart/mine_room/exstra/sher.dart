// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';




// class MyHomePage extends StatelessWidget {
//   final String contentToShare = "Check out this amazing post!";

//   const MyHomePage({super.key});

//   Future<void> _shareOnWhatsApp() async {
//     final url = "whatsapp://send?text=$contentToShare";
//     // ignore: deprecated_member_use
//     if (await canLaunch(url)) {
//       // ignore: deprecated_member_use
//       await launch(url);
//     } else {
//       if (kDebugMode) {
//         print("Could not launch WhatsApp");
//       }
//     }
//   }

//   void _shareOnFacebook() {
//     Share.share(contentToShare, subject: "Shared via Facebook");
//   }

//   void _shareOnMessenger() {
//     Share.share(contentToShare, subject: "Shared via Messenger");
//   }

//   void _showShareDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Share on Social Media"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.share),
//                 title: const Text("WhatsApp"),
//                 onTap: _shareOnWhatsApp,
//               ),
//               ListTile(
//                 leading: const Icon(Icons.share),
//                 title: const Text("Facebook"),
//                 onTap: _shareOnFacebook,
//               ),
//               ListTile(
//                 leading: const Icon(Icons.share),
//                 title: const Text("Messenger"),
//                 onTap: _shareOnMessenger,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Social Media Sharing"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               contentToShare,
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _showShareDialog(context),
//               child: const Text("Share on Social Media"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
