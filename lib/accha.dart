import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';

class Accha extends StatefulWidget {
  @override
  _AcchaState createState() => _AcchaState();
}

class _AcchaState extends State<Accha> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.search,
                  size: 25,
                ),
                onPressed: () {},
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.cart,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: CupertinoColors.white.withOpacity(0),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {},
          ),
        ),
        child: Column(
          children: [
            Stack(children: [
              Image.asset("asset/uff.jpg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.185,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Text(
                        "Bombay Fast Food",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "bdn",
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ],
                  )),
                ],
              )
            ]),
            Card(
                color: CupertinoColors.inactiveGray,
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 4, child: Text("Min Order:₹ 49")),
                          Expanded(
                              flex: 5, child: Text("Delivers In :40 Mins")),
                          Expanded(flex: 2, child: Text("Veg Only")),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 4,
                              child: Text(
                                  "Free Home Delivery on Order More than ₹")),
                          Expanded(
                            flex: 1,
                            child: Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                value: switchState,
                                onChanged: (bool value) {
                                  setState(() {
                                    switchState = value;
                                  });
                                  print(value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: ListView.builder(
                //physics: BouncingScrollPhysics(),
                //shrinkWrap: true,
                itemCount: dishName.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: CupertinoColors.inactiveGray,
                    child: GestureDetector(
                      onTap: () {
                        Expanded(
                          child: ListView.builder(
                            itemCount: dishName.length,
                            itemBuilder: (context, index) {
                              return ListTile(title: Text(dishName[index]));
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "asset/aa.jpg",
                                  scale: 6,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(dishName[index]))),
                            Expanded(
                                flex: 1,
                                child: Icon(CupertinoIcons.chevron_down))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
