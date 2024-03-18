import 'package:flutter/material.dart';
import 'package:shade_style/components/rounded_button.dart';
import 'package:shade_style/components/textfield_container.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       const Text("Login",style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        fontFamily: "Days one"
       ),),
      const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "username"
        ),
       )),
       const TextFieldContainer(child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "password"
        ),
       )),


      Row(
        mainAxisAlignment: MainAxisAlignment.end,
      children: [
            TextButton(onPressed: (){},
            style:const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.fromLTRB(0, 0, 45,0)
              )
            ),
            child: Text("Forget password?",style: TextStyle(
            color: Colors.blue.shade700,
          ),),
        )
      ],
      ),


       RoundedButton(child: TextButton(
        onPressed: (){},
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
         child:const Text("Login")),),

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
         child:const Text("Register")),),
      ]),
      )
    );
  }
}