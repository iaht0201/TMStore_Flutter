import 'package:flutter/material.dart';
import 'package:appecommerceflutter/models/cateogry_model.dart';
import 'package:hexcolor/hexcolor.dart';

class CategorList extends StatelessWidget {
  const CategorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Category" ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500, fontFamily: 'OpenSans'),),
          SizedBox(height: 10,),
          SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...list_category.map((e) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: HexColor("#FFEDDD"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("${e.image}",
                              width: 40, height: 40, fit: BoxFit.cover)),
                      /* Image.asset("${e.image}" , width: 60, height: 60, fit: BoxFit.cover),*/
                      SizedBox(
                        height: 5,
                        width: 15,
                      ),
                      Text(
                        '${e.name}',
                        style:
                            TextStyle(fontSize: 12, color: HexColor("#939393")),
                      ),
                    ],
                  ),
                );
              }).toList()
            ],
          ),
    ),
        ],
      );
  }
}
