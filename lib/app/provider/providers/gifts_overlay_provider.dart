import 'package:canary_app/app/components/image_handler.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GiftOverlayProvider extends ChangeNotifier {
  OverlayEntry? _overlayEntry;

  show(BuildContext context, Gift gift, String sender, String reciever) {
    closeOverLay();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GiftBanner(
          gift: gift,
          sender: sender,
          reciever: reciever,
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  closeOverLay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class GiftBanner extends StatelessWidget {
  const GiftBanner(
      {super.key,
      required this.gift,
      required this.sender,
      required this.reciever});
  final Gift gift;
  final String sender;
  final String reciever;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height / 10,
      left: width * 0.1,
      child: SizedBox(
        width: width * 0.8,
        height: height * 0.1,
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.grey.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const ImageHandler(
                  path: "images/pic_room.jpg",
                  borderRadious: 50,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        sender,
                        style: const TextStyle(color: Colors.amber),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "أرسل هدية الى ",
                          children: [
                            TextSpan(
                                text: reciever,
                                style: const TextStyle(color: Colors.amber)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.network("$serverLink${gift.pic}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
