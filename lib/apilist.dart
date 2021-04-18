
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var dio = Dio();
var Rdata;

Future<Welcome> createAlbumManu() async {
  print("da");
  dio.options.contentType = Headers.formUrlEncodedContentType;
  final response = await dio.post(
    "http://doorbell-deliveries.in/OldData_10022021/doorbell_old/food_user/getMenuDetails.php",
    data: {'city_id': 22,},
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );

  if (response.statusCode == 200) {
    var restaurantData = jsonDecode(response.data);
    print(restaurantData.toString());
    Rdata = Welcome.fromJson(jsonDecode(response.data));
    return Welcome.fromJson(jsonDecode(response.data));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Welcome {
  Welcome({
    this.cakeCallNo,
    this.allMenuDetails,
  });

  String cakeCallNo;
  List<AllMenuDetail> allMenuDetails;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    cakeCallNo: json["cake_call_no"],
    allMenuDetails: List<AllMenuDetail>.from(json["all_menuDetails"].map((x) => AllMenuDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cake_call_no": cakeCallNo,
    "all_menuDetails": List<dynamic>.from(allMenuDetails.map((x) => x.toJson())),
  };
}

class AllMenuDetail {
  AllMenuDetail({
    this.menuId,
    this.menuName,
    this.menuImgs,
    this.isAvail,
    this.menuOpen,
    this.submenu,
  });

  String menuId;
  String menuName;
  dynamic menuImgs;
  IsAvail isAvail;
  Open menuOpen;
  List<Submenu> submenu;

  factory AllMenuDetail.fromJson(Map<String, dynamic> json) => AllMenuDetail(
    menuId: json["menu_id"],
    menuName: json["menu_name"],
    menuImgs: json["menu_imgs"],
    isAvail: isAvailValues.map[json["is_avail"]],
    menuOpen: openValues.map[json["menu_open"]],
    submenu: List<Submenu>.from(json["submenu"].map((x) => Submenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu_id": menuId,
    "menu_name": menuName,
    "menu_imgs": menuImgs,
    "is_avail": isAvailValues.reverse[isAvail],
    "menu_open": openValues.reverse[menuOpen],
    "submenu": List<dynamic>.from(submenu.map((x) => x.toJson())),
  };
}

enum IsAvail { YES }

final isAvailValues = EnumValues({
  "yes": IsAvail.YES
});

enum Open { NO }

final openValues = EnumValues({
  "no": Open.NO
});

class Submenu {
  Submenu({
    this.subMenuId,
    this.menuId,
    this.subMenuName,
    this.menuImg,
    this.isAvailSubmenu,
    this.discountType,
    this.openTime,
    this.closeTime,
    this.menuType,
    this.createdDate,
    this.restOpen,
    this.originalPrice,
    this.discountValue,
    this.payableAmt,
    this.subMenuType,
    this.extraCharges,
    this.containerCharge,
    this.cakeCallNo,
    this.menuName,
    this.isCustizeMenu,
    this.custizeMenu,
  });

  String subMenuId;
  String menuId;
  String subMenuName;
  String menuImg;
  IsAvail isAvailSubmenu;
  DiscountType discountType;
  String openTime;
  String closeTime;
  SubmenuMenuType menuType;
  DateTime createdDate;
  Open restOpen;
  String originalPrice;
  String discountValue;
  String payableAmt;
  SubMenuType subMenuType;
  String extraCharges;
  String containerCharge;
  String cakeCallNo;
  String menuName;
  String isCustizeMenu;
  List<CustizeMenu> custizeMenu;

  factory Submenu.fromJson(Map<String, dynamic> json) => Submenu(
    subMenuId: json["sub_menu_id"],
    menuId: json["menu_id"],
    subMenuName: json["sub_menu_name"],
    menuImg: json["menu_img"] == null ? null : json["menu_img"],
    isAvailSubmenu: isAvailValues.map[json["is_avail_submenu"]],
    discountType: discountTypeValues.map[json["discount_type"]],
    openTime: json["open_time"],
    closeTime: json["close_time"],
    menuType: submenuMenuTypeValues.map[json["menu_type"]],
    createdDate: DateTime.parse(json["created_date"]),
    restOpen: openValues.map[json["rest_open"]],
    originalPrice: json["original_price"],
    discountValue: json["discount_value"],
    payableAmt: json["payable_amt"],
    subMenuType: subMenuTypeValues.map[json["sub_menu_type"]],
    extraCharges: json["extra_charges"],
    containerCharge: json["container_charge"],
    cakeCallNo: json["cake_call_no"],
    menuName: json["menu_name"],
    isCustizeMenu: json["is_custize_menu"],
    custizeMenu: List<CustizeMenu>.from(json["custize_menu"].map((x) => CustizeMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sub_menu_id": subMenuId,
    "menu_id": menuId,
    "sub_menu_name": subMenuName,
    "menu_img": menuImg == null ? null : menuImg,
    "is_avail_submenu": isAvailValues.reverse[isAvailSubmenu],
    "discount_type": discountTypeValues.reverse[discountType],
    "open_time": openTime,
    "close_time": closeTime,
    "menu_type": submenuMenuTypeValues.reverse[menuType],
    "created_date": createdDate.toIso8601String(),
    "rest_open": openValues.reverse[restOpen],
    "original_price": originalPrice,
    "discount_value": discountValue,
    "payable_amt": payableAmt,
    "sub_menu_type": subMenuTypeValues.reverse[subMenuType],
    "extra_charges": extraCharges,
    "container_charge": containerCharge,
    "cake_call_no": cakeCallNo,
    "menu_name": menuName,
    "is_custize_menu": isCustizeMenu,
    "custize_menu": List<dynamic>.from(custizeMenu.map((x) => x.toJson())),
  };
}

class CustizeMenu {
  CustizeMenu({
    this.custMenuId,
    this.custMenuName,
    this.price,
    this.menuType,
    this.createdDate,
  });

  String custMenuId;
  String custMenuName;
  String price;
  CustizeMenuMenuType menuType;
  DateTime createdDate;

  factory CustizeMenu.fromJson(Map<String, dynamic> json) => CustizeMenu(
    custMenuId: json["cust_menu_id"],
    custMenuName: json["cust_menu_name"],
    price: json["price"],
    menuType: custizeMenuMenuTypeValues.map[json["menu_type"]],
    createdDate: DateTime.parse(json["created_date"]),
  );

  Map<String, dynamic> toJson() => {
    "cust_menu_id": custMenuId,
    "cust_menu_name": custMenuName,
    "price": price,
    "menu_type": custizeMenuMenuTypeValues.reverse[menuType],
    "created_date": createdDate.toIso8601String(),
  };
}

enum CustizeMenuMenuType { SIZE, TOPPING }

final custizeMenuMenuTypeValues = EnumValues({
  "SIZE": CustizeMenuMenuType.SIZE,
  "TOPPING": CustizeMenuMenuType.TOPPING
});

enum DiscountType { PER }

final discountTypeValues = EnumValues({
  "per": DiscountType.PER
});

enum SubmenuMenuType { NORMAL }

final submenuMenuTypeValues = EnumValues({
  "normal": SubmenuMenuType.NORMAL
});

enum SubMenuType { VEG, NON_VEG }

final subMenuTypeValues = EnumValues({
  "Non Veg": SubMenuType.NON_VEG,
  "Veg": SubMenuType.VEG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}





class ApiData extends StatefulWidget {
  @override
  _ApiDataState createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // child :FutureBuilder<Welcome>(
      //               future: _futureAlbum,
      //               builder: (context, snapshot) {
      //                 if (snapshot.hasData) {
      //                   return Column(
      //                     children: <Widget>[
      //                       Text(snapshot.data.),
                            
                            
      //                     ],
      //                   );
      //                 } else if (snapshot.hasError) {
      //                   return Text("${snapshot.error}");
      //                 }

      //                 return CircularProgressIndicator();
      //               },
                    
      //             ),
      
    );
  }
}