// ignore_for_file: avoid_unnecessary_containers

import 'package:canary_app/app/MyRoom.dart/mic/mic.dart';
import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/skeleton.dart';
import 'package:canary_app/data/datasources/remote_database/links.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:canary_app/domain/models/gift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Geftbox extends StatefulWidget {
  const Geftbox({super.key});

  @override
  State<Geftbox> createState() => _GeftboxState();
}

class _GeftboxState extends State<Geftbox> {
  List<int> selectedList = [];
  int selectedGift = -1;
  List<Gift>? _gifts;
  bool isLoading = true;

  init() async {
    isLoading = true;
    await context.read<RoomProvider>().getGiftsList().then((state) {
      if (state is ListState<Gift> && mounted) {
        setState(() {
          isLoading = false;
          _gifts = state.list;
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
    return Column(
      children: [
        Container(
          height: 85.h,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Mic(
                isSelected: selectedList.contains(index),
                onTap: () {
                  setState(() {
                    if (selectedList.contains(index)) {
                      selectedList.removeWhere((element) => element == index);
                    } else {
                      selectedList.add(index);
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          color: Colors.black87,
          child: ListView(
            //هاذه الليسته تغير قائمة الهدايا اللتي تحت
            scrollDirection: Axis.horizontal,
            children: const [
              MyButton(
                text: "جديد",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "علاقة",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "بلد",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "مشاهير",
                fontColor: Colors.white,
              ),
              MyButton(
                text: "حقيبة",
                fontColor: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black87,
            child: _gifts == null && isLoading
                ? getLoader()
                : _gifts == null
                    ? getError()
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: _gifts?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedGift == index) {
                                  selectedGift = -1;
                                } else {
                                  selectedGift = index;
                                }
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: 59.h,
                                            width: 59.w,
                                            child: SvgPicture.network(
                                                "$serverLink${_gifts![index].pic}"),
                                          ),
                                          if (selectedGift == index)
                                            const CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius: 10,
                                              child: Icon(
                                                Icons.done,
                                                size: 10,
                                              ),
                                            ),
                                        ],
                                      ),
                                      Text(
                                        _gifts![index].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _gifts![index].price.toString(),
                                    style: const TextStyle(
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
          ),
        ),
        Container(
          height: 61,
          width: double.infinity,
          color: Colors.black,
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              const Text(
                "<<الشحن",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 4,
              ),
              const Icon(
                Icons.paid_outlined,
                size: 35,
                color: Colors.amberAccent,
              ),
              Text(
                context.watch<CoreProvider>().myProfile?.balance.toString() ??
                    "0",
                style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(
                flex: 4,
              ),
              TextButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(22),
                      fixedSize: MaterialStatePropertyAll(Size.zero),
                      iconSize: MaterialStatePropertyAll(20),
                      iconColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 201, 192, 163),
                      )),
                  onPressed: () {},
                  child: const Text(
                    "ارسال",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Spacer(flex: 1),
            ],
          ),
        )
      ],
    );
  }

  getLoader() {
    return ListView(
      children: const [
        Skeleton(
          height: 60,
          width: 60,
        ),
        Skeleton(
          height: 60,
          width: 60,
        ),
        Skeleton(
          height: 60,
          width: 60,
        ),
        Skeleton(
          height: 60,
          width: 60,
        ),
        Skeleton(
          height: 60,
          width: 60,
        ),
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
}
