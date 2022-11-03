import 'package:appecommerceflutter/providers/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key? key}) : super(key: key);



  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  // List<String> list = [
  //   "Arshad",
  //   "khan",
  //   "junaid",
  //   "Babar",
  //   "Tariq",
  //   "Mobile",
  //   "Thai",
  //   "Tien",
  //   "Ha My ngu loz",
  //   "Hamy cc",
  //   "kjfds",
  //   "kjkfhs",
  //   "kjhds",
  //   "fgds"
  // ];

  String search = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProduct();
    //provider.getProductModelSearch(search);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
      ),
      body: Column(
        children: [
          // TextFormField(
          //   onChanged: (value) {
          //     setState(() {
          //       search = value;
          //     });
          //   },
          // ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Colors.deepOrangeAccent),
                        color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Products ...",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 0, top: 5),
                          prefixIcon: Icon(Icons.search, color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                //Icon(Icons.filter_list, color: Colors.black54),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Colors.deepOrangeAccent),
                        color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: (const Icon(Icons.filter_list, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: provider.list_products.length,
                itemBuilder: (context, index) {
                  if (search.isEmpty) {
                    // return Column(
                    //   children: [
                    //     ...provider.list.map((e){
                    //       return ListTile(
                    //         title: Text("${e.title}"),
                    //       );
                    //     }).toList(),
                    //   ],
                    // );
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height,
                            height: MediaQuery.of(context).size.height - 200,
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 10, right: 10),
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 1,
                              childAspectRatio: 2 / 3.5,
                              children: [
                                ...provider.list_products.map((e) {
                                  return Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.deepOrangeAccent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.deepOrangeAccent,
                                              offset: Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ]),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Column(children: [
                                          Image(
                                            image: NetworkImage('${e.image}'),
                                            fit: BoxFit.fill,
                                            width: 100,
                                            height: 120,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            '${e.title}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Giá: ${e.price}.000 vnđ',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.only(left: 30),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Đánh giá: ${e.rating?.rate}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: InkWell(
                                              onTap: null,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: Container(
                                                  width: 80,
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        size: 14,
                                                        color: Colors.white,
                                                      ),
                                                      Text(" Add to Cart",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  );
                                }).toList()
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (provider.list_products[index].title
                      .toString()
                      .toLowerCase()
                      .contains(search)) {
                    return Column(
                      children: [
                        // ListTile(
                        //   title: Text(provider.list[index].title.toString()),
                        // ),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.deepOrangeAccent,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children: [
                                      Image(
                                        image: NetworkImage('${provider.list_products[index].image}'),
                                        fit: BoxFit.fill,
                                        width: 80,
                                        height: 80,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.7,
                                            child: Text(
                                              '${provider.list_products[index].title}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Giá: ${provider.list_products[index].price}.000 vnđ',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Đánh giá: ${provider.list_products[index].rating?.rate}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),

                                        ],
                                      )
                                    ]),
                                SizedBox(height: 10),
                                Container(
                                  child: InkWell(
                                    onTap: null,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Container(
                                        width: 80,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            Text(" Add to Cart",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return Container();
                }),
          ),
        ],
      ),
    );
  }
}
