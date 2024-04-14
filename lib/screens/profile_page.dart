import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shade_style/components/rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CollectionReference _user  =FirebaseFirestore.instance.collection('user');
  final FirebaseAuth auth = FirebaseAuth.instance;

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<void>_changeField(String fieldname,DocumentSnapshot? documentSnapshot)async{
    final TextEditingController fieldTextBox = TextEditingController();
    fieldTextBox.text = documentSnapshot![fieldname];
    await showModalBottomSheet(isScrollControlled: true,context: context, builder: (BuildContext context){
      return Padding(padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20
      ),child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: fieldTextBox,
            
            decoration:const InputDecoration(
              hintText: "Type here",
            ),
          ),

          RoundedButton(child: TextButton(onPressed: ()async{
            await _user.doc(documentSnapshot.id)
            .update({fieldname:fieldTextBox.text});
            fieldTextBox.text='';
          },
          style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(
             Color(0xFFE6940F)
          ),
          foregroundColor: MaterialStatePropertyAll(
            Colors.black
          )
        ),child:const Text("Update"),),)
        ],
      ),);
    });
  }


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
              height: 100,
              width: 100,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,),
                child: Image.asset('images/avatar1.png')
            ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userEmail!, style: TextStyle(color: Colors.grey.shade600,
                  fontWeight: FontWeight.w700),),
                ],
              ),
            Container(
              child: StreamBuilder(stream: _user.where("email",isEqualTo: userEmail).snapshots(),
                     builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot){
                      if (streamSnapshot.hasData){
                        return Column(
                          children: [
                            Card(
                              margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder:(context,index){
                              final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                              return Column(
                                children: [
                                  ListTile(title:const Text("First Name",),
                                  subtitle: Text(documentSnapshot['firstname']),
                                  trailing: IconButton(icon:const Icon(Icons.edit,size: 10,),onPressed: ()async{
                                    await _changeField('firstname', documentSnapshot);
                                  },),),
            
                                  ListTile(title:const Text("Last Name",),
                                  subtitle: Text(documentSnapshot['lastname']),
                                   trailing: IconButton(icon:const Icon(Icons.edit,size: 10),onPressed: ()async{
                                    await _changeField('lastname', documentSnapshot);
                                   },),),
            
                                  ListTile(title:const Text("Address",),
                                  subtitle: Text(documentSnapshot['address']),
                                   trailing: IconButton(icon:const Icon(Icons.edit,size: 10),onPressed: ()async{
                                    await _changeField('address', documentSnapshot);
                                   },),),
            
                                  ListTile(title:const Text("Phone Number",),
                                  subtitle: Text(documentSnapshot['phone']),
                                   trailing: IconButton(icon:const Icon(Icons.edit,size: 10),onPressed: ()async{
                                    await _changeField('phone', documentSnapshot);
                                   },),)
                                ],
                              );
                              })  
                            )
                          ],
                        );
                      }else{
                       return const Center(child: CircularProgressIndicator(),);
                      }
                     }),
            )
        ]),
      ),
    );
  }
}