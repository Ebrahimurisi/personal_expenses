import 'package:flutter/material.dart';

ThemeData getDarkTheme() => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal,
    hintColor: Colors.orange,
    scaffoldBackgroundColor: const Color(0xFF121212), // Dark background color
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1F1F1F), // Dark AppBar color
      elevation: 2.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.teal[200]),
      bodyLarge: const TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.teal,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF1E1E1E), // Dark card color
      elevation: 4.0,
      shadowColor: Colors.black54, // Dark shadow color
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.black, // Text color for FAB in dark mode
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.teal.withOpacity(0.1), // TextField background color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.teal[200]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.teal[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.orange, width: 2.0),
      ),
      labelStyle: TextStyle(color: Colors.teal[200]),
      hintStyle: TextStyle(color: Colors.teal[100]),
    ),
  );
