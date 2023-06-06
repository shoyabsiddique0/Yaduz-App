import 'dart:ui';

import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offer;
  final String imageLink;
  final void Function() function;

  OfferCard({super.key, required this.offer, required this.function, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageLink),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                width: 220.0,
                height: 150.0,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment:
                  WrapCrossAlignment.center,
                  children: [
                    Text(
                      offer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Inria",
                          overflow: TextOverflow.visible),
                    ),
                    TextButton(
                        onPressed: function,
                        child: const Text(
                          "Shop Now",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              color: Color(0xffBD0044)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
