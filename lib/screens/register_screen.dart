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
          Navigator.pushNamed(context, '/'); //shuld be replace with login navigattion route name.
        },icon:const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xFF164650),
      ),
      body: SingleChildScrollView(
        child: Container(
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
      
         const Padding( padding: EdgeInsets.only(bottom: 15),
           child:TextFieldContainer(child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Phone"
            ),
           )),
         ),

        const TextFieldContainer(child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Address"
          ),
         )),

         const TextFieldContainer(child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Postal code"
          ),
         )),

         const Padding( padding: EdgeInsets.only(bottom: 15),
           child: TextFieldContainer(child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Country"
            ),
           )),
         ),

         
         const TextFieldContainer(child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Password"
          ),
         )),

        const Padding( padding: EdgeInsets.only(bottom: 20),
          child: TextFieldContainer(child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Confirm password"
            ),
           )),
        ),
      
         RoundedButton(child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
          style:const ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            ),
            backgroundColor: MaterialStatePropertyAll(
              Color(0xFFE6940F)
            ),
            foregroundColor: MaterialStatePropertyAll(
              Colors.black
            )
          ),
           child:const Text("Submit")),),
            ],
          ),
        ),
      ),
    );
  }
}