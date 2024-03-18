import 'package:flutter/material.dart';
import 'package:shade_style/screens/address_screen.dart';
import 'package:shade_style/screens/login_screen.dart';
import 'package:shade_style/screens/password_screen.dart';
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
        '/address_screen':(context) => const AddressScreen(),
        '/password_setting_screen':(context) => const PasswordScreen(),
      },
    );
  }
}
