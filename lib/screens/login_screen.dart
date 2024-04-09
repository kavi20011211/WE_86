import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shade_style/components/rounded_button.dart';
import 'package:shade_style/components/textfield_container.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController _username = TextEditingController();
 final TextEditingController _password = TextEditingController();
  //user sign in function
  Future <bool> _signInWithUsernameAndPassword(String username,String password)async{
    try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: username,
    password: password
  );
  return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  return false;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF164650),
        leading: const Icon(Icons.abc),
      ),
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
      TextFieldContainer(child: TextField(
        controller: _username,
        decoration:const InputDecoration(
          border: InputBorder.none,
          hintText: "username or email"
        ),
       )),
       TextFieldContainer(child: TextField(
        obscureText: true,
        controller: _password,
        decoration:const InputDecoration(
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
        onPressed: ()async{
          bool isSuccess =await _signInWithUsernameAndPassword(_username.text, _password.text);
          if(isSuccess == true){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You are logged in.", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  dismissDirection: DismissDirection.up,
                ));
            Navigator.pushNamed(context, '/controller_screeen');
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Something wrong! try again.", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  dismissDirection: DismissDirection.up,
                ));
          }
          
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
             Color(0xFF164650)
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