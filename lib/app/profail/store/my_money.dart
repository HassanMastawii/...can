import 'package:canary_app/app/messages/customer_service/customers_service.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/domain/extensions/extention.dart';
import 'package:flutter/material.dart';
import '../../widgets/my_animated_button.dart';

class MyMoney extends StatefulWidget {
  const MyMoney({super.key});

  @override
  State<MyMoney> createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  int _index = 0;
  double sliderVal = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    "images/money/money_card.jpg",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Center(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "المتبقي من الذهب",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "12583",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
              children: [
                getMoneyButton(
                  coins: 7200,
                  money: 10,
                  icon: "1coin.png",
                ),
                getMoneyButton(
                  coins: 18000,
                  money: 25,
                  icon: "2coin.png",
                ),
                getMoneyButton(
                  coins: 36000,
                  money: 50,
                  icon: "3coin.png",
                ),
                getMoneyButton(
                  coins: 72000,
                  money: 100,
                  icon: "stack_coin.png",
                ),
                getMoneyButton(
                  coins: 145000,
                  money: 200,
                  icon: "1stack_coin.png",
                ),
                getMoneyButton(
                  coins: 360000,
                  money: 500,
                  icon: "2stack_coin.png",
                ),
              ],
            ),
          ),
          MyButton(
            text: "تواصل مع خدمة العملاء",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomersService(),
                  ));
            },
            color: Colors.orange,
            fontColor: Colors.black,
          )
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    "images/money/diamond_card.jpg",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Center(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "المتبقي من الألماس",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "12583",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: sliderVal,
                    label: "$sliderVal",
                    max: 12583,
                    thumbColor: Colors.green,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      setState(() {
                        sliderVal = value;
                      });
                    },
                  ),
                ),
                Text(
                  "${sliderVal.toInt()}",
                ),
              ],
            ),
          ),
          const Text(
            "تفاصيل التحويل",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          10.getHightSizedBox(),
          const Text(
            "الهدايا التي ستحصل عليها ستتحول تلقائيا إلى الماس \nيتم تنشيط البيانات كل 5 دقائق \nنسبة تحويل الالماس هي 1:1 \n",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          MyButton(
            text: "تحويل إلى ذهب",
            fontColor: Colors.black,
            color: Colors.green,
            onPressed: () {},
          )
        ],
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const ListTile(
          title: Text(
            "تم تحويل 100 من الألماس إلى ذهب",
          ),
          trailing: Text("2023/08/9 12:05 pm"),
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          if (_index != 2)
            Positioned.fill(
              child: OverflowBox(
                maxHeight: MediaQuery.of(context).size.height,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  _index == 0
                      ? 'images/money/money_back.jpg'
                      : 'images/money/diamond_back.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          SafeArea(
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyAnimatedButton(
                          isPressed: _index == 0,
                          text: "الذهب",
                          onTap: () {
                            setState(() {
                              _index = 0;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyAnimatedButton(
                          isPressed: _index == 1,
                          text: "الألماس",
                          onTap: () {
                            setState(() {
                              _index = 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyAnimatedButton(
                          isPressed: _index == 2,
                          text: "التفاصيل",
                          onTap: () {
                            setState(() {
                              _index = 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                screens[_index],
              ],
            ),
          ),
        ],
      ),
    );
  }

  getMoneyButton({
    void Function()? onTap,
    required int coins,
    required int money,
    required String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
          color: const Color.fromARGB(255, 207, 207, 207),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                Image.asset("images/money/$icon"),
                Text(
                  "$coins",
                  style:
                      const TextStyle(color: Color.fromARGB(255, 91, 91, 90)),
                ),
                10.getHightSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/money/bill.png"),
                    Text("$money"),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
