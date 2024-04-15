import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shade_style/widgets/ProductsAppBar.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('product');
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
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
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
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 26)),
                              SizedBox(
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
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                      child: Text(
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
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text(
                                "Colour",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              SizedBox(
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
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                      child: Text(
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
                          padding: EdgeInsets.only(top: 30, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your first button click logic here
                                  print('Button 1 clicked!');
                                },
                                child: Text(
                                  'Buy Now',
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Add your second button click logic here
                                  print('Button 2 clicked!');
                                },
                                child: Text(
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
