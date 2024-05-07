import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shade_style/widgets/CategoriesWidget.dart';
import 'package:shade_style/widgets/ItemsWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name="";

    final CollectionReference _products =
      FirebaseFirestore.instance.collection('product');

  final CollectionReference _addtocart = FirebaseFirestore.instance.collection('addtocart');
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void>_addToCartList(String productName, int price)async{
    String currentUserID = auth.currentUser!.uid;
    try{
      await _addtocart.doc().set({
        "productName":productName,
        "price":price,
        "userID":currentUserID
      });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("You have successfully added this product.", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,
    ));
    }catch (e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Something went wrong.", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,
    ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            //height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 250,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              name=value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Serch you item here...",
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search_rounded,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CategoriesWidget(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Recent Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 15, 29, 183),
                    ),
                  ),
                ),

                StreamBuilder(
                  stream: _products.snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot>streamSnapshot){
                  if(name.isNotEmpty){
                  return GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 300),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: streamSnapshot.data!.docs.length,
           itemBuilder: (context,index){
            final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
            if(documentSnapshot["ProductTitle"].toString().toLowerCase().startsWith(name.toLowerCase())){
                return Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.red.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0)),
                  child: Image.network(documentSnapshot["image"],height: 170,fit: BoxFit.cover,width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Failed to load image');
                  },
                  )
                ),
                Padding(padding:const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(documentSnapshot["ProductTitle"], style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 8.0,),
                  Text(documentSnapshot["price"].toString(),style: const TextStyle(
                    fontWeight: FontWeight.normal
                  ),),
                ],),),
                const SizedBox(height: 8.0,),
                Row(
                  children: [IconButton(onPressed: ()async{
                    await _addToCartList(documentSnapshot["ProductTitle"], documentSnapshot["price"]);
                  }, icon:const Icon(Icons.add_shopping_cart_rounded)),
                  IconButton(onPressed: (){
                    Navigator.pushNamed(context, '/product', arguments: documentSnapshot.id);
                  }, icon:const Icon(Icons.more_vert_rounded))],
                )
              ],
            ),
            );
            }            
           });
                  }
                  return Padding(
                  padding:const EdgeInsets.all(24),
                  child: ItemsWidget());
                  },
                ),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
