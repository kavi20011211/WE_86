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
    final dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<DocumentSnapshot>(
          stream: _products.doc(data).snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
            if (documentSnapshot.hasData) {
              final DocumentSnapshot<Object?>? data = documentSnapshot.data;
              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          child: Image.network(
                            data?["image"],
                            height: 200,
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
                              data?["ProductTitle"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              data?["ProductDescription"],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Sizes: ",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                for (String i in data?["size"])
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(" $i |"),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Colours: ",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                for (String i in data?["color"])
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(" $i |"),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Price: ",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Text(data?["price"].toString() ?? ""),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await _addToCartList(
                                          data?["ProductTitle"],
                                          data?["price"]);
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart_rounded,
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
