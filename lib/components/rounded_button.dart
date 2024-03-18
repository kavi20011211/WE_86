import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final child;
  const RoundedButton({Key? key, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin:const EdgeInsets.only(top:10,bottom: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: child
      ),
    );
  }
}