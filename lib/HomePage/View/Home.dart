import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:yaduzfashion/HomePage/Widgets/Card_with_shop.dart';
import 'package:yaduzfashion/HomePage/Widgets/Coupon.dart';
import 'package:yaduzfashion/HomePage/Widgets/OfferCard.dart';
import 'package:yaduzfashion/HomePage/Widgets/Pop_Cat_Card.dart';

class Home extends StatelessWidget{
  Home({super.key});
  var _current = 0.obs;
  List images = [
    "assets/images/nike.png",
    "assets/images/nike.png",
    "assets/images/nike.png",
    "assets/images/nike.png",
    "assets/images/nike.png",
    "assets/images/nike.png"
  ];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Get.defaultDialog(
              title: "Warning",
              middleText: "Are you sure you want to sign out",
             textConfirm: "Yes",
              textCancel: "No",
              onConfirm: (){
                final auth = FirebaseAuth.instance;
                auth.signOut();
                Get.back();
              }
            );

          }, icon: Icon(Icons.logout, color: Colors.black,))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Bag"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: "Profile"),
          ],
          unselectedItemColor: Colors.black,
          selectedItemColor: const Color(0xffBD0044),
          showUnselectedLabels: true,
          elevation: 50),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText:
                        "Search for your favorite products, brands and more...",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            // const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/boy.png",
                          height: 100,
                        ),
                      ),
                      const Text(
                        "Men",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ), //Categories
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
                items: [
                  Image.asset("assets/images/banner.png"),
                  Image.asset("assets/images/banner.png"),
                  Image.asset("assets/images/banner.png"),
                  Image.asset("assets/images/banner.png"),
                ],
                options: CarouselOptions(
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    _current.value = index;
                  },
                ),
              carouselController: _controller,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3, 4].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: ShapeDecoration(
                          shape: _current.value == entry.key
                              ? TriangleShapeBorder(sideLength: 12)
                              : CircleBorder(side: BorderSide.none,eccentricity: 0),
                          color:
                          (Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xffD6B5BB)
                              : const Color(0xffE41238))
                              .withOpacity(
                              _current.value == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ), //Indicator
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 394,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/images/background.png").image,
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Clearance Sale",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: "Inter"),
                  ),
                  const Text(
                    "5000+ Styles up-to 40% Off",
                    style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/woman.png",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //Clearance Sale
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
              height: 380,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Featured Brands",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "5000+ Styles up-to 40% Off",
                        style: TextStyle(fontFamily: "Inter", fontSize: 17),
                      ),
                    ],
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        child: Image.asset(images[index]),
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  )
                ],
              ),
            ), //Gridview Brands
            Container(
              color: Colors.white,
              child: Image.asset("assets/images/card1.png"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 541,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset("assets/images/pop_cat_bg.png").image,
                    fit: BoxFit.fitHeight),
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Popular in Categories",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "5000+ Styles up-to 40% Off",
                        style: TextStyle(fontFamily: "Inter", fontSize: 17),
                      ),
                    ],
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 100 / 190),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return PopularCategory(imageLink: "assets/images/pop_cat_card.png", type: "Clothing",);
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  )
                ],
              ),
            ), //Popular Categories
            Container(
              color: Colors.white,
              child: Image.asset("assets/images/card2.png"),
            ),
            Coupon(perc: "10", minPurchase: "6500", discount: "3500", couponCode: "PREMIUM1K200"), //Coupons
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 394,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          Image.asset("assets/images/new_arrival_bg.png").image,
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New Arrivals",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: "Inter"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              "assets/images/tag.png",
                              fit: BoxFit.scaleDown,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "5000+ Styles up-to 40% Off",
                        style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/new_arrival_woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/new_arrival_woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/new_arrival_woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/new_arrival_woman.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/new_arrival_woman.png",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Image.asset("assets/images/card1.png"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 427,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          Image.asset("assets/images/deal_of_day_bg.png").image,
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Deals of the Day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Inter"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Deal with the Deal now!",
                        style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: Image.asset("assets/images/deal_of_day.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: Image.asset("assets/images/deal_of_day.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: Image.asset("assets/images/deal_of_day.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: Image.asset("assets/images/deal_of_day.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: Image.asset("assets/images/deal_of_day.png"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //Deal of the day
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 394,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          Image.asset("assets/images/recent_view_bg.png").image,
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Recently Viewed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Inter"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "5000+ Styles up-to 40% Off",
                        style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/recent_view_man.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/recent_view_man.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/recent_view_man.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/recent_view_man.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 250,
                          width: 150,
                          child: CardWithShop(
                            title: "Black Rib button Draw",
                            type: "Women",
                            price: "1699",
                            discountedPrice: "1699",
                            imageLink: "assets/images/recent_view_man.png",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //recently Viewed
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 428,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/images/offer_bg.png").image,
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Oh my Offers!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Inter"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Offers that don’t come Often",
                        style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: OfferCard(offer: "50% OFF on DENIMS", function: (){}, imageLink: "assets/images/offer_card.png")
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: OfferCard(offer: "50% OFF on DENIMS", function: (){}, imageLink: "assets/images/offer_card.png")
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: OfferCard(offer: "50% OFF on DENIMS", function: (){}, imageLink: "assets/images/offer_card.png")
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: OfferCard(offer: "50% OFF on DENIMS", function: (){}, imageLink: "assets/images/offer_card.png")
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: 220,
                          child: OfferCard(offer: "50% OFF on DENIMS", function: (){}, imageLink: "assets/images/offer_card.png")
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //Offers
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.only(top: 19, bottom: 19),
              color: const Color(0xffFFF1F6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          width: 33,
                          height: 30,
                          child: Image.asset("assets/images/truck.png")),
                      const Text("On time Delivery")
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: 33,
                          height: 30,
                          child: Image.asset("assets/images/payment.png")),
                      const Text("Secure Payment")
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: 33,
                          height: 30,
                          child: Image.asset("assets/images/return.png")),
                      const Text("Easy Return")
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleShapeBorder extends ShapeBorder {
  final double sideLength;

  TriangleShapeBorder({required this.sideLength});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left + sideLength / 2, rect.top);
    path.lineTo(rect.left, rect.bottom);
    path.lineTo(rect.right, rect.bottom);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => TriangleShapeBorder(sideLength: sideLength * t);
}
