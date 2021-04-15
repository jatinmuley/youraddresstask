import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'list.dart';

class Accha extends StatefulWidget {
  @override
  _AcchaState createState() => _AcchaState();
}

class _AcchaState extends State<Accha> {
  bool switchState = false;
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;

  int counter = 0;

  void incre() {
    setState(() {
      counter++;
    });
  }

  void decre() {
    setState(() {
      counter--;
    });
  }

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
                itemCount: restro.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    //color: CupertinoColors.activeOrange,
                    child: ExpansionTile(
                      title: Container(
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "asset/aa.jpg",
                                scale: 6,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Text(restro[index].title))),
                          ],
                        ),
                      ),
                      children: [
                        Column(
                          children: _buildExpandableContent(restro[index]),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: ListView.builder(
                        //     //physics: BouncingScrollPhysics(),
                        //     //shrinkWrap: true,
                        //       itemCount: subList.length,
                        //       itemBuilder: (context, index) {
                        //         return Text(subList[index]);
                        //       }),
                        // )
                      ],
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

  List<bool> check = List.filled(10000, false);

  _buildExpandableContent(Restaurant restro) {
    List<Widget> columnContent = [];

    for (String content in restro.contents) {
      columnContent.add(
        GestureDetector(
          onTap: () {
            //onDabao(context);

            onQuan(context);
            // showCupertinoModalBottomSheet(
            //   context: context,
            //   builder: (BuildContext context) => CupertinoActionSheet(
            //     title: Text('Extra Pav'),
            //     cancelButton: CupertinoActionSheetAction(child: Text("Update Cart"),onPressed: (){},),
            //     //message: const Text('Message',textAlign: TextAlign.start),
            //     actions: [
            //       Text("  Extra Topping"),
            //       Card(
            //         elevation: 0,
            //         //color: Colors.transparent,
            //         child: Container(
            //           padding: EdgeInsets.all(10),
            //           child: Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   Checkbox(
            //                     value: checkBoxValue,
            //                     onChanged: (bool value) {
            //                       setState(() {
            //                         checkBoxValue = value;
            //                       });
            //                       print(value);
            //                     },
            //                   ),
            //                   SizedBox(
            //                     width: 10,
            //                   ),
            //                   Expanded(flex:20,child: Text("Butter")),
            //                   Expanded(flex:5,child: Text("₹10")),
            //                 ],
            //               ),
            //               Row(
            //                 children: [
            //                   Checkbox(
            //                     value: checkBoxValue,
            //                     onChanged: (bool value) {
            //                       setState(() {
            //                         checkBoxValue = value;
            //                       });
            //                       print(value);
            //                     },
            //                   ),
            //                   SizedBox(
            //                     width: 10,
            //                   ),
            //                   Expanded(flex:20,child: Text("Butter")),
            //                   Expanded(flex:5,child: Text("₹10")),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // );
          },
          child: new Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "asset/aa.jpg",
                        scale: 7,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        children: [
                          Text(content),
                          Text(pricee[4]),
                        ],
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),

                  Text("customizable"),
                  Icon(CupertinoIcons.ellipsis_circle_fill),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return columnContent;
  }

  void onDabao(context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
        return CupertinoActionSheet(
          //title: Text('Extra Pav'),
          cancelButton: CupertinoActionSheetAction(
            child: Text("Update Cart"),
            onPressed: () {},
          ),
          //message: const Text('Message',textAlign: TextAlign.start),
          actions: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Extra Topping"),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: checkBoxValue,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue = value;
                                });

                                print(value);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(flex: 20, child: Text("Butter")),
                            Expanded(flex: 5, child: Text("₹10")),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: checkBoxValue1,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue1 = value;
                                });

                                print(value);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(flex: 20, child: Text("Ghee")),
                            Expanded(flex: 5, child: Text("₹20")),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void onQuan(context) {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, setState) {
              return CupertinoActionSheet(
                //title: Text('Extra Pav'),
                cancelButton: CupertinoActionSheetAction(
                  child: Text("Update Cart"),
                  onPressed: () {},
                ),
                //message: const Text('Message',textAlign: TextAlign.start),
                actions: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pulav"),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Select Quantity"),
                                  CupertinoButton(
                                      child: Icon(CupertinoIcons.minus),
                                      onPressed: () {
                                        setState(() {
                                          decre();
                                        });
                                      }),
                                  Text('$counter'),
                                  CupertinoButton(
                                      child: Icon(CupertinoIcons.plus),
                                      onPressed: () {
                                        setState(() {
                                          incre();
                                        });
                                      }),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

class Restaurant {
  final String title;
  List<String> contents = [];
  List<String> prices = [];

  Restaurant(this.title, this.contents, this.prices);
}
