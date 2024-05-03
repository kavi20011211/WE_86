import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffE09540)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff006d6f)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff006d6f)),
  ),
);

ThemeData Full_Color_Blind_Theme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000000)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffffff)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff000000)),
  ),
);

ThemeData Red_Green_Theme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff072673)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6E7271)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff072673)),
  ),
);

ThemeData Blue_Yellow_Theme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff689689)),
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
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6B6D76)),
    // textStyle: MaterialStateProperty.resolveWith(
    //   (states) =>
    //       const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    // ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff689689)),
  ),
);
