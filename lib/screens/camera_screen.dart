import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
    
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                margin:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:const Offset(4, 5), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  image:const DecorationImage(image: AssetImage('images/imageforcamera.jpg'))
                ),
              ),
            ),
    
            const Text("Select an image from camera or device.", style: TextStyle(
              fontWeight: FontWeight.w900
            ),),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2430),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(onPressed: (){},icon:const Icon(Icons.folder), color: Colors.white,),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2430),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(onPressed: (){},icon:const Icon(Icons.camera_alt_rounded), color: Colors.white,),
                )
              ],
            ),
    
            
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: const Color(0xFFE6940F),child:const Icon(Icons.question_mark_rounded,color: Colors.white,)),
    );
  }
}