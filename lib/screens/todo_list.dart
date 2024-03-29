import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  var checked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed:(){},
      backgroundColor: const Color(0xFFE6940F),
      child: const Icon(Icons.add,color: Colors.white)
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width ,

        child: Expanded(child: Card(
          margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(itemBuilder: (context,index)=> Column(
            children: [
              ListTile(
                leading: IconButton(onPressed: (){},icon:const Icon(Icons.task_alt_rounded,color: Colors.white,),),
                title:const Text("Task Name",style: TextStyle(color:  Color(0xFFF7EEC9),fontWeight: FontWeight.bold),),
                subtitle: const Text("Additional details", style: TextStyle(color:  Color(0xFFF7EEC9),),),
                tileColor:const Color(0xFF2C2430),
                trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.edit_attributes_rounded,color: Colors.white,)),
                onLongPress: () {
                  //delete when long press
                },
              ),
              const Divider(height: 5.0,thickness: 0.8,)
            ],
          )),
        )),
      ),
    );
  }
}