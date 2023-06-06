import 'package:flutter/material.dart';

class PopularCategory extends StatelessWidget {
  final String imageLink;
  final String type;

  PopularCategory({super.key, required this.imageLink, required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    width: 121,
                    height: 180,
                    child: Image.asset(
                      imageLink,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 2.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 98.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: const BorderRadius.all(
                    Radius.circular(10.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
