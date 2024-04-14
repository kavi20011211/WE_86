import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final CollectionReference _wishlist  =FirebaseFirestore.instance.collection('wishlist');
  final FirebaseAuth auth = FirebaseAuth.instance;
  
// Methods of the page
Future <void> _deleteTaskItem(String taskID) async{
  await _wishlist.doc(taskID).delete();
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("You have successfully deleted a task", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,
    ));
}

Future <bool> _createTask(String id,String taskname, String additionaldetails)async{
  try{
    await _wishlist.doc().set({
    "taskName":taskname,
    "additionalDetails":additionaldetails,
    "Userid":id
  });
  return true;
  }catch(e){
    print(e);
    return false;
  }

}

Future<void>_editTaskItem([DocumentSnapshot?documentSnapshot])async{
  final TextEditingController taskName = TextEditingController();
  final TextEditingController additionaldetails = TextEditingController();

  if(documentSnapshot!=null){
    taskName.text = documentSnapshot['taskName'];
    additionaldetails.text = documentSnapshot['additionalDetails'];
  }

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
            controller: taskName,
            
            decoration:const InputDecoration(
              hintText: "Type here",
            ),
          ),
          TextField(
            controller: additionaldetails,
            
            decoration:const InputDecoration(
              hintText: "Type here",
            ),
          ),

          RoundedButton(child: TextButton(onPressed: ()async{
            await _wishlist.doc(documentSnapshot!.id)
            .update({'taskName':taskName.text,'additionalDetails':additionaldetails.text});
            taskName.text='';
            additionaldetails.text='';
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
        ]));
  }
);}

Future<void> _createTaskItemForm()async{
  String currentUserID = auth.currentUser!.uid;
  final TextEditingController _taskname = TextEditingController();
  final TextEditingController _additionaldetails = TextEditingController();
    if(currentUserID.isEmpty){
      Navigator.pushNamed(context, '/');
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context){
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
            controller: _taskname,
            decoration:const InputDecoration(
              hintText: "Task name",
            ),
          ),
          TextField(
            controller: _additionaldetails,
            decoration:const InputDecoration(
              hintText: "Additional details (optional)",
            ),
          ),
          RoundedButton(child: TextButton(
        onPressed: ()async{
          bool isSuccess = await _createTask(currentUserID, _taskname.text, _additionaldetails.text);
          if(isSuccess){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("You have successfully added a task", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,
    ));
    _taskname.text="";
    _additionaldetails.text="";
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Something went wrong!, try again", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    dismissDirection: DismissDirection.up,
    ));
          }
        },
        style:const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(
             Color(0xFFE6940F)
          ),
          foregroundColor: MaterialStatePropertyAll(
            Colors.black
          )
        ),
         child:const Text("Add Task")))
        ],
      ),);
    });
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed:(){
        _createTaskItemForm();
      },
      backgroundColor: const Color(0xFFE6940F),
      child: const Icon(Icons.add,color: Colors.white)
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: StreamBuilder(
        stream: _wishlist.where("Userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot){
            if(streamSnapshot.hasData){
              return Column(
                  children: [
          Expanded(child: Card(
          margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder:(context,index){
            final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
            return Column(
            children: [
              ListTile(
                leading: IconButton(onPressed: (){},icon:const Icon(Icons.task_alt_rounded,color: Colors.white,),),
                title: Text(documentSnapshot['taskName'],style:const TextStyle(color:  Color(0xFFF7EEC9),fontWeight: FontWeight.bold),),
                subtitle: Text(documentSnapshot['additionalDetails'], style:const TextStyle(color:  Color(0xFFF7EEC9),),),
                tileColor:const Color(0xFF2C2430),
                trailing: IconButton(onPressed: ()async{
                  await _editTaskItem(documentSnapshot);
                }, icon:const Icon(Icons.edit,color: Colors.white,)),
                onLongPress: () async{
                  //delete when long press
                  await _deleteTaskItem(documentSnapshot.id);
                },
              ),
              const Divider(height: 5.0,thickness: 0.8,)
            ],
          );
            },),
        ))
        ],
      );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      )
    );
  }
}

