import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  

  File? _selectedImage;
  List? _recognitions;
  bool isModelLoaded = false;
  // List<dynamic> dataList = jsonDecode();
  // Map<String,dynamic> data = jsonDecode();

    @override
  void initState() {
    super.initState();
    loadModel();
  }

  void loadModel() async {
    await Tflite.loadModel(
      model: "assets/color_recognition.tflite",
      labels: "assets/labels.txt",
    );

    setState(() {
      isModelLoaded = true;
    });
  }

    void runModelOnImage(File image) async {
    if(isModelLoaded){
      try{
        var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
    );

    setState(() {
      _recognitions = recognitions;
    });
      }catch(e){
        print(e);
      }
    }else{
      print("Model is not loaded");
    }
  }

  String changeTheLabelToColor(String label){
    if(label == "0"){
      return "Black";
    }else if(label == "1"){
      return "Blue";
    }else if(label == "2"){
      return "Brown";
    }else if(label == "3"){
      return "Green";
    }else if(label == "4"){
      return "Grey";
    }else if(label == "5"){
      return "Orange";
    }else if(label == "6"){
      return "Red";
    }else if(label == "7"){
      return "Purple";
    }else if(label == "8"){
      return "White";
    }else if(label == "9"){
      return "Yellow";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage == null?
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
            ): 
            Column(
              children: [
                Center(child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.file(_selectedImage!),
            ),),

            Text(changeTheLabelToColor(_recognitions?[0]["label"].toString()??""), style:const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24
            ),),           
            const SizedBox(height: 10),
            
              ],
            ),
            
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
                  child: IconButton(onPressed: ()async{
                    await _pickImageFromGallery();
                  },icon:const Icon(Icons.folder), color: Colors.white,),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2430),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(onPressed: (){
                     if(_selectedImage!=null){
                      runModelOnImage(_selectedImage!);
                     }else{
                      showDialog(context: context, builder: (BuildContext context){
                          return const AlertDialog(
                          content: Text("Select an image before run this."),
                            );
                            });
                     }
                     
                  },icon:const Icon(Icons.search), color: Colors.white),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2430),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(onPressed: ()async{
                    await _pickImageFromCamera();
                    
                  },icon:const Icon(Icons.camera_alt_rounded), color: Colors.white,),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Select an image from camera or device.", style: TextStyle(
              fontWeight: FontWeight.w900
            ),),
            const SizedBox(height: 10),

            if(_recognitions?[0]["label"].toString() != null)
              _showMatchingColours(changeTheLabelToColor(_recognitions?[0]["label"].toString()??""))
            
          ],
        ),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return const AlertDialog(
            actions: [Icon(Icons.book_rounded,color: Colors.green,)],
            title: Text("Guide",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            content: Text("From this you can find out matching colors, Here are the steps: 1. Select an image from device or camera. 2. Scan the image and get the matching colors."),
          );
        });
      },backgroundColor: const Color(0xFFE6940F),child:const Icon(Icons.question_mark_rounded,color: Colors.white,)),
    );
  }
  
  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future _pickImageFromGallery()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage==null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

  Future _pickImageFromCamera()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage==null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

 _showMatchingColours(String colour){
    final CollectionReference _colours = FirebaseFirestore.instance.collection('colours');
    return  Container(
        child: StreamBuilder(
          stream: _colours.where("colour",isEqualTo: colour).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot) {
            if(streamSnapshot.hasData){ 
              final DocumentSnapshot documentSnapshot =streamSnapshot.data!.docs[0];
               return  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    for(int i=0; i<=6;i++)
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children:[
                          Padding(padding:const EdgeInsets.all(3),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(int.parse(documentSnapshot["hexCode"][i])),
                            shape: BoxShape.circle
                          ),
                          child: Center(child: Text(documentSnapshot["matchingColour"][i]),),
                        ),),
                        ] 
                      ),
                    )
                  ],
                ),
               );
      }return const Center(child: CircularProgressIndicator());}
      )
      );
  }

}

