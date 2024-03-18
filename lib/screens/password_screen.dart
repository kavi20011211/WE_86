import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            
            const Text("Passwords", style: TextStyle(
              fontFamily: "Days one",
              fontSize: 24,
              fontWeight: FontWeight.w900
            ),),

        const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Confirm password"
        ),
       )),

       RoundedButton(child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/');
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
         child:const Text("Submit")),),
         
         RoundedButton(child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/address_screen');
        },
        style:const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(
            Colors.black
          ),
          foregroundColor: MaterialStatePropertyAll(
            Colors.white
          )
        ),
         child:const Text("Back")),),
          ],
        ),
      ),
    );
  }
}