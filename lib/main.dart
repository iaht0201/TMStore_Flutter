import 'package:appecommerceflutter/screens/detail/detailproduct.dart';
import 'package:appecommerceflutter/screens/home/home.dart';
import 'package:appecommerceflutter/screens/home/productlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:appecommerceflutter/providers/product_provider.dart';

// Ham chinh chay giao dien dau tien
void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans' , backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
       "/productdetail": (context) =>  ProductDetail() ,
        "/homepage1" : (context) => HomePage1()
      },
      home: HomePage(),

      color: HexColor("#FFFFFF"),
    ),
  ));

  /*MaterialApp(

      theme: ThemeData(fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
      },
      home: HomePage(),
      color:  HexColor("#e5e5e5"),
    ),*/
}
