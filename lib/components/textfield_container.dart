import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      width: size.width * 0.8,
      margin:const EdgeInsets.only(top: 10.0),
      decoration:  BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
    
  }
}