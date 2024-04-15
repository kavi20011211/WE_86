import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddtoCartScreen extends StatefulWidget {
  const AddtoCartScreen({super.key});

  @override
  State<AddtoCartScreen> createState() => _AddtoCartScreenState();
}

class _AddtoCartScreenState extends State<AddtoCartScreen> {
  final CollectionReference _addtocart = FirebaseFirestore.instance.collection('addtocart'); 



// Methods of the page
Future <void> _deleteCartItem(String productID) async{
  await _addtocart.doc(productID).delete();

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("You have successfully deleted a product", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,

    ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child:StreamBuilder(
          stream: _addtocart.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot) {
            if(streamSnapshot.hasData){     //if row has data
              return Column(
          children:[ 
            Expanded(
            child: Card(
              margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context,index){ 
                final DocumentSnapshot documentSnapshot =streamSnapshot.data!.docs[index];
                return Column(
                children: [
              ListTile(
                leading: IconButton(onPressed: (){},icon:const Icon(Icons.shopping_cart,color: Colors.white),
                ),
                title: Text(documentSnapshot['productName'], style:const TextStyle(
                  color: Color(0xFFF7EEC9),
                  fontWeight: FontWeight.bold
                ),),
                tileColor:const Color(0xFF2C2430),
                subtitle: Text(documentSnapshot['productDetails'], style:const TextStyle(
                  color: Color(0xFFF7EEC9),
                ),),
                onLongPress: () {
                  //on long press the list tile will delete function
                  _deleteCartItem(documentSnapshot.id);
                },

                
              ),
              const Divider(height: 5.0,thickness: 0.8,)
            ],
              );},
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding:const EdgeInsets.all(5),),
            ),
          )]
        );
            }
          
          return const Center(
            child: CircularProgressIndicator(),
          );

          },
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return const AlertDialog(
            actions: [Icon(Icons.book_rounded,color: Colors.green,)],
            title: Text("Guide",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            content: Text("You can add items to your wishlist by clicking heart button. You can delete an item by a longpress"),
          );
        });
      },backgroundColor: const Color(0xFFE6940F),child:const Icon(Icons.question_mark_rounded,color: Colors.white,)),
    );
  }
}











