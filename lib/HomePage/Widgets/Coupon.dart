import 'package:flutter/material.dart';

class Coupon extends StatelessWidget {
  final String perc;
  final String minPurchase;
  final String discount;
  final String couponCode;

  Coupon(
      {super.key,
      required this.perc,
      required this.minPurchase,
      required this.discount,
      required this.couponCode});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        width: MediaQuery.of(context).size.width,
        height: 250,
        color: const Color(0xffF8F8F8),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Column(
            children: [
              Text(
                "Your Unused Coupons",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter"),
              ),
              Text(
                "Don’t let your chance go in vain",
                style: TextStyle(fontSize: 17, fontFamily: "Inter"),
              ),
            ],
          ),
          Container(
            height: 112,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Colors.white,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/coupon_back.png",
                    width: MediaQuery.of(context).size.width * 0.93,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/coupon_front.png",
                    width: MediaQuery.of(context).size.width * 0.93,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$perc%",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter"),
                          ),
                          const Text(
                            "OFF",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter"),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("On minimum purchase of ₹$minPurchase"),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Max Discount ₹$discount",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Use Code : ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(couponCode),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
