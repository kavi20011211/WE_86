import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(child: Card(margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView(
            children:const [
              ListTile(
                    leading: Icon(Icons.info_rounded,color: Colors.green),
                    title: Text("About"),
                    subtitle: Text("version 1.0.0"),
                  )
            ],
          ))
      ),
      ],
      ),
      ),

    );
  }
}