import 'package:flutter/material.dart';
import 'package:shade_style/themes/theme_data.dart';
import 'package:shade_style/widgets/ColorBlindPicwidget.dart';

class TestScreen extends StatefulWidget {
  final Function(ThemeData) onThemeChanged;

  TestScreen({required this.onThemeChanged});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  ThemeData _currentTheme = lightTheme; // Default theme

  void _setTheme(ThemeData theme) {
    setState(() {
      _currentTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.abc),
      ),
      body: ListView(
        shrinkWrap: true,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final newTheme = lightTheme;
                        widget.onThemeChanged(newTheme);
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(60, 40)),
                    ),
                    child: Text('Option 1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final newTheme = Full_Color_Blind_Theme;
                        widget.onThemeChanged(newTheme);
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(60, 40)),
                    ),
                    child: Text('Option 2'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final newTheme = Red_Green_Theme;
                        widget.onThemeChanged(newTheme);
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(60, 40)),
                    ),
                    child: Text('Option 3'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final newTheme = Blue_Yellow_Theme;
                        widget.onThemeChanged(newTheme);
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(60, 40)),
                    ),
                    child: Text('I can see all'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Skip the Test'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
