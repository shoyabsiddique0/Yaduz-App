import 'dart:ui';

import 'package:flutter/material.dart';

class CardWithShop extends StatelessWidget {
  final String imageLink;
  final String title;
  final String type;
  final String discountedPrice;
  final String price;

  CardWithShop({required this.imageLink, required this.title, required this.type, required this.price, required this.discountedPrice});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageLink),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Container(
              color: Colors.white,
              height: 75,
              width: 145,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "Inter",
                          fontSize: 11
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontSize: 13
                      ),
                    ),
                    Text(
                      "₹$price",
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Text(
                      "₹$discountedPrice",
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 55,
          left: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.all( Radius.circular(40.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                child: Image.asset("assets/images/bag.png"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
