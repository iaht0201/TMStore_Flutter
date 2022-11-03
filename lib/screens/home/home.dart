import 'package:appecommerceflutter/models/cateogry_model.dart';
import 'package:appecommerceflutter/models/product_model.dart';
import 'package:appecommerceflutter/screens/detail/detailproduct.dart';
import 'package:appecommerceflutter/screens/home/appbar.dart';
import 'package:appecommerceflutter/screens/home/category.dart';
import 'package:appecommerceflutter/screens/home/productlist.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> productfiltered = [];

  String search = "";

  List<String> _searchList = [
    "a",
    "b",
    "c",
  ];
  List<dynamic> itemsListSearch = [];

  @override
/*  List<Object?> _buildSearchList(List<ProductModel>list_products) {
    if (search.isEmpty) {
      return _searchList = []; //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
     */ /* print(search) ;*/ /*
     */ /* return _searchList.add(= list_products.map((element) => element.title?.contains(search)).cast<ProductModel>().toList()) ;*/ /*

    }
  }*/
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProduct();
    productfiltered = provider.list_products;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.only(left: 20, right: 20), children: [
        HomeAppBar(),
        TextField(
            onChanged: (value) {
              setState(() {
                search = value;
                /* itemsListSearch = _searchList
                    .where((element) =>
                        element.toLowerCase().contains(value.toLowerCase()))
                    .toList();*/
                if (search.isEmpty) {
                  productfiltered = [];
                } else {
                  productfiltered = provider.list_products
                      .where((productx) => productx.title
                          .toString()
                          .toLowerCase()
                          .contains(search.toString().toLowerCase()))
                      .toList();
                }
                itemsListSearch = productfiltered;
                print(itemsListSearch);
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 35,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#F0F2F1")),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#F0F2F1")),
                  borderRadius: BorderRadius.circular(20)),
              hintText: 'Search Here...',
            )),
        Row(
          children: [
            Expanded(
                child: search.isEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CategorList(),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Recent Product"),
                                  Spacer(),
                                  Icon(Icons.filter_alt_outlined),
                                ],
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.45,
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 1 / 1.4,
                                          physics:
                                              NeverScrollableScrollPhysics(),

                                          // scrollDirection: Axis.vertical,
                                          children: [
                                            // ...list.map((item) {
                                            //   return Text(item.title ?? "") ;
                                            // }).toList
                                            ...provider.list_products
                                                .map((item) {
                                              return Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    left: 15,
                                                    right: 15,
                                                    bottom: 12),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: Offset(2,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                  /* border: Border.all(color: HexColor("#939393"))*/
                                                ),
                                                child: Column(children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                            color: HexColor(
                                                                "#67C4A7"),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: const Text(
                                                          "-10%",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.bookmark_border,
                                                        color: Colors.redAccent,
                                                      )
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          ProductDetail
                                                              .routeName,
                                                          arguments: item);
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              100,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  '${item.image}'))),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${item.title}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: HexColor(
                                                              "#393F42"),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        ' \$${item.price} ',
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              width: 120,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                      right: 14,
                                                                      left: 14,
                                                                      top: 6,
                                                                      bottom:
                                                                          6),
                                                              decoration: BoxDecoration(
                                                                  color: HexColor(
                                                                      "#67C4A7"),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4)),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child: Text(
                                                                  "Add to cart",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ))
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ]),
                                              );
                                            }).toList()
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Search result for "${search}"'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: GridView.builder(
                                itemCount: provider.list_products
                                    .where((productx) => productx.title
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            search.toString().toLowerCase()))
                                    .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1 / 1.4,
                                ),
                                /* physics: NeverScrollableScrollPhysics(),*/
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                          bottom: 12),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(2,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                        /* border: Border.all(color: HexColor("#939393"))*/
                                      ),
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: HexColor("#67C4A7"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Text(
                                                "-10%",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Icon(
                                              Icons.bookmark_border,
                                              color: Colors.redAccent,
                                            )
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                ProductDetail.routeName,
                                                arguments:
                                                    itemsListSearch[index]);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                100,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${itemsListSearch[index].image}'))),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${itemsListSearch[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: HexColor("#393F42"),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              ' \$${itemsListSearch[index].price} ',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: 120,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 14,
                                                            left: 14,
                                                            top: 6,
                                                            bottom: 6),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            HexColor("#67C4A7"),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Text(
                                                        "Add to cart",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                    ),
                                  );
                                }),
                            /*child: Column(
                                children: [
                                  ...productfiltered.map((e) {
                                    return Text("${e.title}");
                                  }).toList()
                                ],
                              ))*/
                            /* child: GridView.builder(

                                  itemCount: productfiltered.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),

                                  itemBuilder: (context, index) {

                                    return Container(
                                      child:
                                          Text("${productfiltered[1].title}"),
                                      */ /*child: productfiltered[index].title
                                              .toString()
                                              .toLowerCase()
                                              .contains(search)
                                          ? Text(
                                              "${provider.list_products[index].title}")
                                          : Container(),*/ /*
                                    );
                                  }))*/
                          )
                        ],
                      ))
          ],
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        color: HexColor("#67C4A7"),
        backgroundColor: Colors.transparent,
        items: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Icon(Icons.home, size: 30),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/homepage1");
            },
            child: Icon(Icons.list, size: 30),
          ),
          Icon(Icons.history, size: 30),
          Icon(Icons.manage_accounts, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
