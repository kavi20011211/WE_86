import 'package:flutter/material.dart';
import 'package:shade_style/controller_screen.dart';
import 'package:shade_style/screens/login_screen.dart';
import 'package:shade_style/screens/profile_page.dart';
import 'package:shade_style/screens/register_screen.dart';
// import 'package:shade_style/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => const SplashScreen(),
        '/':(context) => const LoginScreen(),
        '/register':(context) => const RegisterScreen(),
        '/controller_screeen':(context) => const ControllerScreen(),
        '/profile_screen':(context) => const ProfileScreen()
      },
    );
  }
}