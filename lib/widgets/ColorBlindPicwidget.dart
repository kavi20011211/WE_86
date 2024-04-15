import 'package:flutter/material.dart';

class ColorBlindPicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/c1.png",
                  width: 300,
                  height: 300,
                ),
                Image.asset(
                  "images/c2.png",
                  width: 300,
                  height: 300,
                ),
                Image.asset(
                  "images/c3.png",
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
