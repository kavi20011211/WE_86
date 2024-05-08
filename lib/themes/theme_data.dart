import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      backgroundColor:
          MaterialStateProperty.all<Color>(Color.fromARGB(107, 0, 109, 111)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    )),
    appBarTheme: AppBarTheme(
      backgroundColor: (Color(0xff006d6f)),
    ),
    iconTheme: IconThemeData(
        color: Color(0xffE09540) // Change this color to whatever you desire
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: (Color(0xff006d6f)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: (Color.fromARGB(112, 0, 109, 111))),
    cardTheme: CardTheme(color: Colors.white));

ThemeData Full_Color_Blind_Theme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000000)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffffff)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    )),
    appBarTheme: AppBarTheme(
      backgroundColor: (Color(0xff000000)),
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: (Color(0xff000000)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: (Color.fromARGB(113, 0, 0, 0))),
    cardTheme: CardTheme(color: Colors.white));

ThemeData Red_Green_Theme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff072673)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6E7271)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff072673)),
  ),
  iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Color(0xff072673)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: (Color.fromARGB(119, 7, 38, 115))),
  cardTheme: CardTheme(color: Colors.white),
);

ThemeData Blue_Yellow_Theme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff689689)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6B6D76)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    ),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: (Color(0xff689689)),
  ),
  iconTheme: IconThemeData(
      color: Color.fromARGB(
          255, 255, 255, 255) // Change this color to whatever you desire
      ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: (Color(0xff689689)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: (Color.fromARGB(106, 104, 150, 137))),
);
