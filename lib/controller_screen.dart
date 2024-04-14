import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shade_style/authPage.dart';
import 'package:shade_style/screens/add_to_cart.dart';
import 'package:shade_style/screens/camera_screen.dart';
import 'package:shade_style/screens/settings_screen.dart';
import 'package:shade_style/screens/todo_list.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  var _selectedIndex = 0;
    bool signOut(){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
                      
     MaterialPageRoute(builder: ((context) => const AuthPage())));
     return true;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/profile_screen');
        }, icon:const Icon(Icons.person_2_rounded) ),

        IconButton(onPressed: (){ 
         bool isSuccuss =  signOut();
         if(isSuccuss==true){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You have logged out succussfully.", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  dismissDirection: DismissDirection.up,
                ));
         }}, icon:const Icon(Icons.logout_rounded))
      ],
      leading:const Icon(Icons.abc),
      backgroundColor: const Color(0xFF164650),
      ),


      body:_selectedIndex==3? const AddtoCartScreen():_selectedIndex == 1? const TodoListScreen():_selectedIndex ==2? const CameraScreen():_selectedIndex==4?const SettingsScreen():null,


      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
                _selectedIndex = index;
              });
        },
        height: 50,
        color:const Color(0xFF164650),
        items:const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.checklist,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.camera,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_checkout,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}