import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:const Text("Profile", style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),),
      backgroundColor: const Color(0xFF164650),
      ),


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Username", style: TextStyle(color: Colors.grey.shade600,
                  fontWeight: FontWeight.w700),),
            
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_attributes_rounded,color: Colors.grey.shade600,))
                ],
              ),
            )
        ]),
      ),
    );
  }
}