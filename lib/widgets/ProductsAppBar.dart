import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff006d6f),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Product",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(left: 110),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/testscreen');
                },
                child: Icon(
                  Icons.volume_up_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ))
        ],
      ),
    );
  }
}
