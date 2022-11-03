import 'package:appecommerceflutter/models/product_model.dart';
import 'package:appecommerceflutter/screens/detail/detailproduct.dart';
import 'package:appecommerceflutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);
  static const routeName = '/productdetail';

  @override
  State<ProductDetail> createState() => _ProductDetailState();

  String assadsad = "sdsd";
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: HexColor("#FFFFFF"),
        title: Text(
          "${args.title}",
          style: TextStyle(color: Colors.black),
        ),
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Image(
                  image: NetworkImage("${args.image}"),
                  height: 286,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 1,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 9, bottom: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 3),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: HexColor("#67C4A7"),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Text(
                                          "-10%",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        child: Text(
                                          "${args.title}",
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          /* softWrap: false,*/
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "OpenSans",
                                              color: HexColor("#393F42")),
                                        ),
                                      ),
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${15.02}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: HexColor("#929292"),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\$ ${args.price}  ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: HexColor("#393F42"),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.favorite_border,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose the color",

                            /* softWrap: false,*/
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "OpenSans",
                                color: HexColor("#939393")),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              ButtonColor("#F5E3DF"),
                              ButtonColor("#ECECEC"),
                              ButtonColor("#E4F2DF"),
                              ButtonColor("#D5E0ED"),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                color: HexColor("#F0F2F1"),
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: HexColor("#F0F2F1"),
                                width: 1,
                              ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                // Image radius
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Apple Store",

                                    /* softWrap: false,*/
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "OpenSans",
                                        color: HexColor("#393F42")),
                                  ),
                                  Text(
                                    "online 12 mins ago",

                                    /* softWrap: false,*/
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "OpenSans",
                                        color: HexColor("#939393")),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                              width: 107,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  right: 14, left: 14, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "Follow",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Description of product",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "OpenSans",
                                color: HexColor("#393F42")),
                          ),
                          Text(
                            "${args.description}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: "OpenSans",
                                color: HexColor("#393F42")),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Promotion(double price) {
  double pricePromotion = price * (1 - 0.1);
  return Text("${price * 90} ");
}

ButtonColor(String color) {
  return InkWell(
    onTap: () {},
    customBorder: OutlineInputBorder(),
    child: Container(
      margin: EdgeInsets.only(right: 11),
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        color: HexColor("${color}"),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
