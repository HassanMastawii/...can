import 'dart:io';

import 'package:canary_app/app/canary_app.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/device/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangSheet extends StatelessWidget {
  const LangSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.5,
      builder: (context, scrollController) => Column(
        children: [
          ListTile(
            leading: const BackButton(),
            title: Text(
              getText(context, "applang"),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                RadioListTile<String?>(
                  value: "ar",
                  groupValue: context.watch<CoreProvider>().local,
                  onChanged: (p0) {
                    context.read<CoreProvider>().setLocal(p0!);
                    Navigator.pop(context);
                  },
                  title: const Text("Arabic"),
                  subtitle: const Text("(العربية)"),
                ),
                RadioListTile<String?>(
                  value: "en",
                  groupValue: context.watch<CoreProvider>().local,
                  onChanged: (p0) {
                    context.read<CoreProvider>().setLocal(p0!);
                    Navigator.pop(context);
                  },
                  title: const Text("English"),
                  subtitle: const Text("(الانكليزية)"),
                ),
                RadioListTile<String?>(
                  value: getLanguageCode(Platform.localeName),
                  groupValue: context.watch<CoreProvider>().local,
                  onChanged: (p0) {
                    context.read<CoreProvider>().setLocal(p0!);
                    Navigator.pop(context);
                  },
                  title: Text(
                    getText(context, "systemdefault"),
                  ),
                  subtitle: Text("(${Platform.localeName})"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
