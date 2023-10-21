// import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';

class Sher extends StatefulWidget {
  const Sher({super.key});

  @override
  State<Sher> createState() => _SherState();
}

class _SherState extends State<Sher> {
  // AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("ShareToWhatsapp"),
            onPressed: () {
              // Example message and file path, replace with your actual data
              String message = "Check out this cool content!";
              String filePath =
                  "/path/to/your/file"; // Replace with the actual file path

              // Call the shareToWhatsApp method
              shareToWhatsApp(message, filePath);
            },
          ),
        ],
      ),
    );
  }

  // Updated method to include necessary parameters
  shareToWhatsApp(String message, String filePath) async {
    // await appinioSocialShare.shareToWhatsapp(message, filePath: filePath);
  }
}
