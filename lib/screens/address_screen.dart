import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Text("Address", style: TextStyle(
              fontFamily: 'Days one',
              fontSize: 24,
              fontWeight: FontWeight.w900
            ),),

        const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "No"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Lane"
        ),
       )),

       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Postal code"
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
          Navigator.pushNamed(context, '/password_setting_screen');
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
         
         RoundedButton(child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/register');
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