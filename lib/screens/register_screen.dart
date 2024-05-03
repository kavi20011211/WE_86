import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('user');

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
  Future<bool> _createUser(firstname, lastname, email, phone, address, postal,
      country, password, confirmpassword) async {
    try {
      await _users.add({
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "address": address,
        "postalcode": postal,
        "country": country,
        "password": password,
        "confirmpassword": confirmpassword
      });

      _createUserWithEmailPass(email, password);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> _createUserWithEmailPass(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context,
                  '/'); //shuld be replace with login navigattion route name.
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Register here",
                style: TextStyle(
                    fontFamily: 'Days one',
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/signup.jpg'))),
              ),
              TextFieldContainer(
                  child: TextField(
                controller: _firstname,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "First name",
                    suffixIcon: Icon(Icons.person_2_rounded)),
              )),
              TextFieldContainer(
                  child: TextField(
                controller: _lastname,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Last name"),
              )),
              TextFieldContainer(
                  child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    suffixIcon: Icon(Icons.email_rounded)),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFieldContainer(
                    child: TextField(
                  controller: _phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                      suffixIcon: Icon(Icons.phone_android_rounded)),
                )),
              ),
              TextFieldContainer(
                  child: TextField(
                controller: _address,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Address",
                    suffixIcon: Icon(Icons.home_rounded)),
              )),
              TextFieldContainer(
                  child: TextField(
                controller: _postal,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Postal code"),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFieldContainer(
                    child: TextField(
                  controller: _country,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Country"),
                )),
              ),
              TextFieldContainer(
                  child: TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  suffixIcon: Icon(Icons.key_rounded),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFieldContainer(
                    child: TextField(
                  controller: _confirmpassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm password",
                      suffixIcon: Icon(Icons.key_rounded)),
                )),
              ),
              RoundedButton(
                child: ElevatedButton(
                    onPressed: () async {
                      if (_confirmpassword.text != _password.text) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "Passwords are mismatched! try again.",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          dismissDirection: DismissDirection.up,
                        ));
                      } else if (_firstname.text.isEmpty ||
                          _lastname.text.isEmpty ||
                          _email.text.isEmpty ||
                          _phone.text.isEmpty ||
                          _address.text.isEmpty ||
                          _postal.text.isEmpty ||
                          _country.text.isEmpty ||
                          _confirmpassword.text.isEmpty ||
                          _password.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "All fields are required! please try again.",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          dismissDirection: DismissDirection.up,
                        ));
                      } else {
                        bool isSuccess = await _createUser(
                            _firstname.text,
                            _lastname.text,
                            _email.text,
                            _phone.text,
                            _address.text,
                            _postal.text,
                            _country.text,
                            _password.text,
                            _confirmpassword.text);
                        if (isSuccess == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "You are registered succussfully!.",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            dismissDirection: DismissDirection.up,
                          ));
                          Navigator.pushNamed(context, '/');
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "Something went wrong! please try again.",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            dismissDirection: DismissDirection.up,
                          ));
                        }
                      }
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        ),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
