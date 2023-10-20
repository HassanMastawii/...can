import 'package:flutter/material.dart';

class GiftOverlayProvider extends ChangeNotifier {
  OverlayEntry? entry;
  Offset offset = const Offset(20, 40);
  closeOverLay() {
    entry?.remove();
    entry = null;
  }

  showOverLay(BuildContext ctx) {
    entry = OverlayEntry(
      builder: (context) => const GiftOverLay(),
    );
    final overlay = Overlay.of(ctx);
    overlay.insert(entry!);
  }
}

class GiftOverLay extends StatefulWidget {
  const GiftOverLay({super.key});

  @override
  State<GiftOverLay> createState() => _GiftOverLayState();
}

class _GiftOverLayState extends State<GiftOverLay> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
