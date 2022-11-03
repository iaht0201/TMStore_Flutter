import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        children: [
          const Text(
            "TM Shop",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans'),
          ),

          const Spacer(), // dung gian cach 2 ben
          Badge(
            badgeColor: Colors.redAccent,
            padding: EdgeInsets.all(7),
            badgeContent: const Text(
              "3",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Badge(
              badgeColor: Colors.redAccent,
              padding: EdgeInsets.all(7),
              badgeContent: const Text(
                "2",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.notifications_outlined,
                  size: 35,
                ),
              )),
        ],
      ),
    );
  }
}
