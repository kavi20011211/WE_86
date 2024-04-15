import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffE09540)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff006d6f)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
);

ThemeData F_C_Theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
    textStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Color.fromARGB(255, 206, 206, 206)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
);

ThemeData R_D_Theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xf072673)),
    textStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Color(0xf76949f)),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xf072673)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Color(0xf76949f)),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
);

ThemeData B_Y_Theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff94861)),
    textStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Color(0xf689689)),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff94861)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Color(0xf689689)),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
);
