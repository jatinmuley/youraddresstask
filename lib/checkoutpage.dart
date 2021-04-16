import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import'list.dart';
import 'apilist.dart';



class cartPage extends StatefulWidget {
  @override
  _cartPageState createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  int counter = 0;
  int total ;
  void _incrementcounter() {
    setState(() {
      counter++;
      total = counter*10;
    });
  }

  void _decrementcounter() {
    setState(() {
      counter--;
      total = counter*10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Color(0xff292b2c),
        navigationBar: CupertinoNavigationBar(
          middle: Text('Bombay  Fast Food\n Items:$counter '),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {},
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width * 2,
              color: Color(0xff292b2c),
              child: Center(
                  child: Text("Bombay  Fast Food ",
                      style: TextStyle(color: CupertinoColors.white))),
            ),
            Container(
                padding: EdgeInsets.all(10),
                // height: MediaQuery.of(context).size.height * 0.125,
                // width: MediaQuery.of(context).size.width * 2,
                color: Color(0xff292b2c),
                child: 
                // ListView.builder(
                //   itemCount:
                  
                //   itemBuilder: (context,index))

                
                
                
                Column(
                  children: [
                    // cartlist
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(flex: 40, child: Text("Cheese jini Dosa")),
                        Expanded(
                          flex: 20,
                          child: Center(
                            child: Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 20,
                                  ),
                                  onPressed:_decrementcounter,
                                ),
                                Text("$counter"),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 20,
                                  ),
                                  onPressed: _incrementcounter,
                                  
                                  
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 10, child: Text("$total")),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(flex: 40, child: Text("Plain Dosa")),
                        Expanded(
                          flex: 20,
                          child: Center(
                            child: Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    
                                  },
                                ),
                                Text("$counter"),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                   
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 10, child: Text("wait")),
                      ],
                    ),
                    
                  ],
                )
                
                
                ),
            Container(
                // width: MediaQuery.of(context).size.width * 5,
                // height: MediaQuery.of(context).size.height * 0.100,
                padding: EdgeInsets.fromLTRB(11, 0, 0, 5),
                child: Text("Message:")),
            Container(
              margin: EdgeInsets.all(9),
              color: Color(0xff292b2c),
              child: CupertinoTextField(
                placeholder: ("enter your text"),
                maxLines: 10,
              ),
            ),
            Text(
                "Note : Any Restuarant Request? we will try our best to convey it.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff8e3c00),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(11, 0, 0, 5),
                child: Text("Restuarant Bill", textAlign: TextAlign.start)),
            Container(
              padding: EdgeInsets.all(4),
              child: Row(
                // total amount

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(" Total items amount"),
                  // Text("$total"),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Packaging Charge",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: CupertinoColors.systemGrey)),
                  Text("Rs 0",
                      style: TextStyle(
                          fontSize: 13, color: CupertinoColors.systemGrey)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gst"),
                  Text("Rs 0"),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount"),
                  Text("RS 0"),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wallet"),
                  Text("RS 0"),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("To Pay"),
                  // Text("$total"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(9),
                //  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pay"),
                    CupertinoButton.filled(
                        disabledColor: CupertinoColors.activeBlue,
                        child: Text("Pay"),
                        onPressed: null),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// int count = 0;
// int dcount = count;

// int total;
// void incrementcounter() {
//   count++;
//   total = count * 10;
// }

// void dcounter() {
//   count--;
//   total = count * 10;
// }

// int tcount = 0;
// int tdcount = tcount;

// int ttotal;
// void tincrementcounter() {
//   tcount++;
//   ttotal = tcount * 30;
// }

// void tdcounter() {
//   tcount--;
//   ttotal = tcount * 30;
// }

// int totalitems = count + tcount;
// int totalitemsamount = total + ttotal;
