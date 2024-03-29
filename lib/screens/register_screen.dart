import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 final CollectionReference _users = FirebaseFirestore.instance.collection('user'); 

 //text edit controllers
 final TextEditingController _firstname = TextEditingController();
 final TextEditingController _lastname = TextEditingController();
 final TextEditingController _email = TextEditingController();
 final TextEditingController _phone = TextEditingController();
 final TextEditingController _address = TextEditingController();
 final TextEditingController _postal = TextEditingController();
 final TextEditingController _country = TextEditingController();
 final TextEditingController _password = TextEditingController();
 final TextEditingController _confirmpassword = TextEditingController();


 //methods of this pages
 Future<bool>_createUser(firstname,lastname,email,phone,address,postal,country,
 password,confirmpassword)async{
  try{
    await _users.add({"firstname":firstname,"lastname":lastname,"email":email,
    "phone":phone,"address":address,"postalcode":postal,"country":country,"password":password,
    "confirmpassword":confirmpassword});
    return true;
  }catch(e){
    print(e);
    return false;
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/'); //shuld be replace with login navigattion route name.
        },icon:const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xFF164650),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const  Text("Register here", style: TextStyle(
                fontFamily: 'Days one',
                fontSize: 24,
                fontWeight: FontWeight.w900
              ),),
      
          TextFieldContainer(child: TextField(
            controller: _firstname,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "First name",
            suffixIcon: Icon(Icons.person_2_rounded)
          ),
         )),
      
         TextFieldContainer(child: TextField(
          controller: _lastname,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Last name"
          ),
         )),
      
         TextFieldContainer(child: TextField(
          controller: _email,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Email",
            suffixIcon: Icon(Icons.email_rounded)
          ),
         )),
      
         Padding( padding:const EdgeInsets.only(bottom: 15),
           child:TextFieldContainer(child: TextField(
            controller: _phone,
            decoration:const InputDecoration(
              border: InputBorder.none,
              hintText: "Phone",
              suffixIcon: Icon(Icons.phone_android_rounded)
            ),
           )),
         ),

        TextFieldContainer(child: TextField(
          controller: _address,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Address",
            suffixIcon: Icon(Icons.home_rounded)
          ),
         )),

         TextFieldContainer(child: TextField(
          controller: _postal,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Postal code"
          ),
         )),

         Padding( padding:const EdgeInsets.only(bottom: 15),
           child: TextFieldContainer(child: TextField(
            controller: _country,
            decoration:const InputDecoration(
              border: InputBorder.none,
              hintText: "Country"
            ),
           )),
         ),

         
         TextFieldContainer(child: TextField(
          controller: _password,
          obscureText: true,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
            suffixIcon: Icon(Icons.key_rounded),
          ),
         )),

        Padding( padding:const EdgeInsets.only(bottom: 20),
          child: TextFieldContainer(child: TextField(
            controller: _confirmpassword,
            obscureText: true,
            decoration:const InputDecoration(
              border: InputBorder.none,
              hintText: "Confirm password",
              suffixIcon: Icon(Icons.key_rounded)
            ),
           )),
        ),
      
         RoundedButton(child: TextButton(
          onPressed: ()async{
            if(_confirmpassword.text!=_password.text){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Passwords are mismatched! try again.", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  dismissDirection: DismissDirection.up,
                ));
            }
            await _createUser( _firstname.text, _lastname.text, _address.text,_confirmpassword.text, _country.text,
            _email.text,_password.text, _phone.text,_postal.text);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You are registered succussfully!.", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  dismissDirection: DismissDirection.up,
                ));
            Navigator.pushNamed(context, '/');
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
           child:const Text("Submit")),),
            ],
          ),
        ),
      ),
    );
  }
}