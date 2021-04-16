import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_task/accha.dart';
import 'checkoutpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(

      // routes: {

      //     'checkout': (context) => checkoutpage(),



      // },
     // theme: const CupertinoThemeData(brightness: Brightness.light),

      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(
      //   primaryColor: Colors.deepOrange[800],
      //   accentColor: Colors.deepOrange[800],
      //   //brightness: Brightness.dark,
      // ),
      //themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      home:
      
       cartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepOrange[800]),
          backgroundColor: Colors.transparent, title: Text("Your Address")),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: 'First Name',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: 'Last Name',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.mail,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: "Email",
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange[800]),
                        ),
                        hintText: "+91",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 70,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone_android_sharp,
                            color: Colors.deepOrange[800],
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrange[800]),
                          ),
                          hintText: "Mobile Number"),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange[800]),
                        ),
                        hintText: "+91",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 70,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone_android_sharp,
                            color: Colors.deepOrange[800],
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrange[800]),
                          ),
                          hintText: "Alternative Number"),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: 'Address Line 1',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: 'Address Line 2',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.deepOrange[800],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange[800]),
                  ),
                  hintText: 'Pincode',
                ),
              ),
              Container(
                width: 300,
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.deepOrange[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: "Track"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: "Wallet"),
        ],
      ),
    );
  }
}
