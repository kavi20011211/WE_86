import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesWidget extends StatelessWidget {
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      height: 100,
      child: StreamBuilder(
          stream: _categories.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Changed to horizontal scroll
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(3, 20, 3, 3),
                      child: SizedBox(
                        width: 250,
                        child: ListTile(
                          tileColor: const Color(0XFFE5DECA),
                          leading: Container(
                            child: Transform.scale(
                              scale: 0.9,
                              child: Image.network(
                                documentSnapshot["image"],
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          title: Text(
                            documentSnapshot["productsName"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
