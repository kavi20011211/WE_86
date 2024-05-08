import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('product');

  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference _addtocart =
      FirebaseFirestore.instance.collection('addtocart');

  Future<void> _addToCartList(String productName, int price) async {
    String currentUserID = auth.currentUser!.uid;
    try {
      await _addtocart.doc().set({
        "productName": productName,
        "price": price,
        "userID": currentUserID
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "You have successfully added this product.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        dismissDirection: DismissDirection.up,
      ));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Something went wrong.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        dismissDirection: DismissDirection.up,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 300),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Theme.of(context)
                            .floatingActionButtonTheme
                            .backgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                              child: Image.network(
                                documentSnapshot["image"],
                                height: 170,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text('Failed to load image');
                                },
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  documentSnapshot["ProductTitle"],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  documentSnapshot["price"].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await _addToCartList(
                                        documentSnapshot["ProductTitle"],
                                        documentSnapshot["price"]);
                                  },
                                  icon: const Icon(
                                      Icons.add_shopping_cart_rounded)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/product',
                                        arguments: documentSnapshot.id);
                                  },
                                  icon: const Icon(Icons.more_vert_rounded))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
