import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('product');
      final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference _addtocart = FirebaseFirestore.instance.collection('addtocart');

  Future<void>_addToCartList(String productName)async{
    String currentUserID = auth.currentUser!.uid;
    try{
      await _addtocart.doc().set({
        "productName":productName,
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF164650),
        ),
        body: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[0];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Image.network(
                            "https://m.media-amazon.com/images/I/41ERYvjQ+DS._AC_SL1000_.jpg",
                            height: 300,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                documentSnapshot['ProductTitle'],
                                style:const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          //height: 70,
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  documentSnapshot['ProductDescription'],
                                  textAlign: TextAlign.justify,
                                  style:const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Size",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 26)),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      margin:
                                         const EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          )
                                        ],
                                      ),
                                      child:const Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Colour",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      margin:
                                        const  EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          )
                                        ],
                                      ),
                                      child:const Text(
                                        's',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.only(top: 30, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your first button click logic here
                                  print('Button 1 clicked!');
                                },
                                child:const Text(
                                  'Buy Now',
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Add your second button click logic here
                                  _addToCartList(documentSnapshot['ProductTitle'].toString());
                                },
                                child:const Text(
                                  'Add to cart',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
