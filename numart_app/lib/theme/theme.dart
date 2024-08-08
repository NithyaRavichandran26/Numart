import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: false).copyWith(
  primaryColor: const Color(0xFFEF476F), // Pink color from the logo
  colorScheme: const ColorScheme.light(primary: Color(0xFFEF476F)).copyWith(
    secondary: const Color(0xFF8338EC), // Purple color from the logo
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFFFA69E), // Orange color from the logo
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFEF476F), // Pink color for buttons
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFEF476F), // Pink color for FAB
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black87),
    bodyText2: TextStyle(color: Colors.black54),
    headline1: TextStyle(color: Color(0xFFEF476F)), // Pink color for headlines
  ),
);
