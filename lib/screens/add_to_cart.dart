import 'package:flutter/material.dart';

class AddtoCartScreen extends StatefulWidget {
  const AddtoCartScreen({super.key});

  @override
  State<AddtoCartScreen> createState() => _AddtoCartScreenState();
}

class _AddtoCartScreenState extends State<AddtoCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Container(
          child: Expanded(
            child: Card(
              margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ListView.builder(itemBuilder: (context,index)=> Column(
                children: [
              ListTile(
                leading: IconButton(onPressed: (){},icon:const Icon(Icons.shopping_cart,color: Colors.white),
                ),
                title: const Text("Product Name", style: TextStyle(
                  color: Color(0xFFF7EEC9),
                  fontWeight: FontWeight.bold
                ),),
                tileColor:const Color(0xFF2C2430),
                subtitle: const Text("Product details.", style: TextStyle(
                  color: Color(0xFFF7EEC9),
                ),),
                onLongPress: () {
                  //on long press the list tile will delete function
                },

                
              ),
              const Divider(height: 5.0,thickness: 0.8,)
            ],
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding:const EdgeInsets.all(5),),
            ),
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){},
            backgroundColor:const Color(0xFFE6940F),
            child:const Icon(Icons.question_mark_rounded,color: Colors.white),),
    );
  }
}

