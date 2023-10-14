// ignore_for_file: sized_box_for_whitespace

import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/skeleton.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:canary_app/domain/models/backgrounds.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bacpicroom extends StatefulWidget {
  const Bacpicroom({Key? key, required this.room}) : super(key: key);
  final Room room;
  @override
  State<Bacpicroom> createState() => _BacpicroomState();
}

class _BacpicroomState extends State<Bacpicroom> {
  List<Background>? _backgrounds;
  bool isLoading = true;

  init() async {
    isLoading = true;
    await context.read<RoomProvider>().getBackgrounds().then((state) {
      if (state is ListState<Background> && mounted) {
        setState(() {
          isLoading = false;
          _backgrounds = state.list;
        });
      }
      if (state is ErrorState && mounted) {
        setState(() {
          isLoading = false;
        });
        MySnackBar.showMyToast(text: state.failure.message);
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: _backgrounds == null && isLoading
              ? getLoader()
              : _backgrounds == null
                  ? getError()
                  : ListView.builder(
                      itemCount: _backgrounds!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 500,
                                  width: double.infinity,
                                  child: Image.network(
                                    "$serverLink${_backgrounds![index].src}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Card(
                                  color: Colors.black.withOpacity(0.5),
                                  child: ListTile(
                                    title: Text(
                                      "اسم الخلفية : ${_backgrounds![index].name}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    // subtitle: Text(
                                    //   "سعر الخلفية : ${_backgrounds![index].price}",
                                    //   style:
                                    //       const TextStyle(color: Colors.white),
                                    // ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(22),
                                    child: MyButton(
                                      text: "شراء الخلفية",
                                      color: Colors.blue,
                                      isLoading: context
                                          .watch<RoomProvider>()
                                          .isLoading,
                                      fontColor: Colors.white,
                                      onPressed: () async {
                                        // عند الضغط، قم بعرض ديالوج التأكيد
                                        bool confirmPurchase =
                                            await _showConfirmationDialog(
                                                index);

                                        // استمر في إجراء الشراء إذا تم التأكيد
                                        if (confirmPurchase) {
                                          await _buyBackground(
                                              _backgrounds![index].src);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }

  Future<void> _buyBackground(String path) async {
    await context
        .read<RoomProvider>()
        .setbackgroundImg(path, widget.room.roomId!)
        .then((state) {
      if (state is DoneState && mounted) {
        widget.room.background = path;
        MySnackBar.showDoneToast();
      }
      if (state is ErrorState && mounted) {
        setState(() {
          isLoading = false;
        });
        MySnackBar.showMyToast(text: state.failure.message);
      }
    });
  }

  getLoader() {
    return ListView(
      children: const [
        Skeleton(height: 200),
        Skeleton(height: 200),
        Skeleton(height: 200),
        Skeleton(height: 200),
        Skeleton(height: 200),
      ],
    );
  }

  getError() {
    return Column(
      children: [
        100.getHightSizedBox(),
        TextButton(
          onPressed: () {
            setState(() {
              init();
            });
          },
          child: Text(
            "إعادة المحاولة",
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ],
    );
  }

  Future<bool> _showConfirmationDialog(int index) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("تأكيد الشراء"),
          content: Text(
            "ان سعر الخلفيه هو ${_backgrounds![index].price}",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("نعم"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text("لا"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    // Default to false if the dialog is dismissed
    return result ?? false;
  }
}
