import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context,'/'); //shuld be replace with login navigattion route name.
        },icon:const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  Text("Register here", style: TextStyle(
              fontFamily: 'Days one',
              fontSize: 24,
              fontWeight: FontWeight.w900
            ),),

        const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "First name"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Last name"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Phone"
        ),
       )),

       RoundedButton(child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/address_screen');
        },
        style: ButtonStyle(
          padding:const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(
            Colors.green.shade500
          ),
          foregroundColor:const MaterialStatePropertyAll(
            Colors.black
          )
        ),
         child:const Text("Next")),),
          ],
        ),
      ),
    );
  }
}