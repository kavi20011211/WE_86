import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shade_style/authPage.dart';
import 'package:shade_style/controller_screen.dart';
import 'package:shade_style/screens/HomePage.dart';
import 'package:shade_style/screens/ProductDetails.dart';
import 'package:shade_style/screens/TestScreen.dart';
import 'package:shade_style/screens/profile_page.dart';
import 'package:shade_style/screens/register_screen.dart';
// import 'package:shade_style/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const AuthPage(),
        '/register': (context) => const RegisterScreen(),
        '/controller_screeen': (context) => const ControllerScreen(),
        '/profile_screen': (context) => const ProfileScreen(),
        '/home_screen': (context) => HomePage(),
        '/product': (context) => ProductDetails(),
        '/test_screen': (context) => TestScreen()
      },
    );
  }
}
