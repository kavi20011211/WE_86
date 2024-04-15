import 'package:flutter/material.dart';
import 'package:shade_style/themes/theme_data.dart';
import 'package:shade_style/widgets/ColorBlindPicwidget.dart';

class TestScreen extends StatefulWidget {
  var isDarkTheme;
  // TestScreen({required this.isDarkTheme});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF164650),
        leading: const Icon(Icons.abc),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
          ),
          ColorBlindPicWidget(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isDarkTheme = !widget.isDarkTheme;
                    });
                  },
                  child: Text('Option 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isDarkTheme = !widget.isDarkTheme;
                    });
                  },
                  child: Text('Option 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Option 3
                    print('Option 3 selected');
                  },
                  child: Text('Option 3'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('I can see all'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle Skip the Test

                    Navigator.pushNamed(context, '/home_screen');
                  },
                  child: Text('Skip the Test'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
