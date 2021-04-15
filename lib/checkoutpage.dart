import 'package:bloc_pattern/bloc_pattern.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:new_task/main.dart';
import 'bloc/cartListBloc.dart';
import "list.dart";
import 'model/fooditem.dart';


class checkoutPage extends StatelessWidget {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<FoodItem> foodItems;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: CartBody(foodItems),
            ),
          //  bottomNavigationBar: BottomBar(foodItems),
          );
        } else {
          return Container(
            child: Text("Something returned null"),
          );
        }
      },
    );;
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemList() : noItemContainer(),
          )
        ],
      ),
    );
  }


}
class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
       // DragTargetWidget(bloc),
      ],
    );
  }
}

Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "No More Items ",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              fontSize: 20),
        ),
      ),
    );
  }

 ListView foodItemList() {
    var foodItems;
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }
          class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
child: ItemContent(foodItem: foodItem),

    );
  }
}
class ItemContent extends StatelessWidget {
  final FoodItem foodItem;
  ItemContent({@required this.foodItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: [Text(foodItem.title)],
      )
    );
  }
}


  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              Text(
                "Order",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

// ignore: camel_case_types
// class cartPage extends StatefulWidget {
//   @override
//   _cartPageState createState() => _cartPageState();
// }

// // ignore: camel_case_types
// class _cartPageState extends State<cartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: CupertinoPageScaffold(
//         backgroundColor: Color(0xff292b2c),
//         navigationBar: CupertinoNavigationBar(
//           middle: Text('Bombay  Fast Food\n Items: '),
//           leading: CupertinoNavigationBarBackButton(
//             onPressed: () {},
//           ),
//         ),
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 45),
//             Container(
//               height: 65,
//               width: MediaQuery.of(context).size.width * 2,
//               color: Color(0xff292b2c),
//               child: Center(
//                   child: Text("Bombay  Fast Food ",
//                       style: TextStyle(color: CupertinoColors.white))),
//             ),
            // Container(
            //     padding: EdgeInsets.all(10),
            //     // height: MediaQuery.of(context).size.height * 0.125,
            //     // width: MediaQuery.of(context).size.width * 2,
            //     color: Color(0xff292b2c),
            //     child: Column(
            //       children: [
            //         // cartlist
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Expanded(flex: 40, child: Text("Cheese jini Dosa")),
            //             Expanded(
            //               flex: 20,
            //               child: Center(
            //                 child: Row(
            //                   children: [
            //                     CupertinoButton(
            //                       padding: EdgeInsets.all(10),
            //                       child: Icon(
            //                         CupertinoIcons.minus,
            //                         size: 20,
            //                       ),
            //                       onPressed: () {
            //                         dcounter();
            //                       },
            //                     ),
            //                     Text("$count"),
            //                     CupertinoButton(
            //                       padding: EdgeInsets.zero,
            //                       child: Icon(
            //                         CupertinoIcons.plus,
            //                         size: 20,
            //                       ),
            //                       onPressed: () {
            //                         incrementcounter();
            //                       },
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             Expanded(flex: 10, child: Text("$total")),
            //           ],
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Expanded(flex: 40, child: Text("Plain Dosa")),
            //             Expanded(
            //               flex: 20,
            //               child: Center(
            //                 child: Row(
            //                   children: [
            //                     CupertinoButton(
            //                       padding: EdgeInsets.all(10),
            //                       child: Icon(
            //                         CupertinoIcons.minus,
            //                         size: 20,
            //                       ),
            //                       onPressed: () {
            //                         tdcounter();
            //                       },
            //                     ),
            //                     Text("$tcount"),
            //                     CupertinoButton(
            //                       padding: EdgeInsets.zero,
            //                       child: Icon(
            //                         CupertinoIcons.plus,
            //                         size: 20,
            //                       ),
            //                       onPressed: () {
            //                         tincrementcounter();
            //                       },
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             Expanded(flex: 10, child: Text("$ttotal")),
            //           ],
            //         ),
            //       ],
            //     )),

            // special message

//             Container(
//                 // width: MediaQuery.of(context).size.width * 5,
//                 // height: MediaQuery.of(context).size.height * 0.100,
//                 padding: EdgeInsets.fromLTRB(11, 0, 0, 5),
//                 child: Text("Message:")),

//             Container(
//               margin: EdgeInsets.all(9),
//               color: Color(0xff292b2c),
//               child: CupertinoTextField(
//                 placeholder: ("enter your text"),
//                 maxLines: 10,
//               ),
//             ),
//             Text(
//                 "Note : Any Restuarant Request? we will try our best to convey it.",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                   color: Color(0xff8e3c00),
//                 )),

//             Container(
//                 padding: EdgeInsets.fromLTRB(11, 0, 0, 5),
//                 child: Text("Restuarant Bill", textAlign: TextAlign.start)),
//             Container(
//               padding: EdgeInsets.all(4),
//               child: Row(
//                 // total amount

//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

//                 children: [
//                   Text(" Total items amount"),
//                  // Text("$total"),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Packaging Charge",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13,
//                           color: CupertinoColors.systemGrey)),
//                   Text("Rs 0",
//                       style: TextStyle(
//                           fontSize: 13, color: CupertinoColors.systemGrey)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Gst"),
//                   Text("Rs 0"),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Discount"),
//                   Text("RS 0"),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Wallet"),
//                   Text("RS 0"),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("To Pay"),
//                  // Text("$total"),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//                 padding: EdgeInsets.all(9),
//                 //  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Pay"),
//                     CupertinoButton.filled(
//                         disabledColor: CupertinoColors.activeBlue,
//                         child: Text("Pay"),
//                         onPressed: null),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
