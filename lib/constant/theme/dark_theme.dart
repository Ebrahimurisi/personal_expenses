import 'package:flutter/material.dart';
import 'package:personal_expenses/constant/theme_color/dark_theme_color.dart';
ThemeData getDarkTheme() => ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  primaryColor: Colors.teal, // Primary color for AppBar, FAB, etc.
  hintColor: Colors.orange, // Accent color for interactive elements
  scaffoldBackgroundColor: Colors.teal.withOpacity(0.1), // Dark background for scaffold
  appBarTheme: AppBarTheme(
    color: DarkThemeColors.appBarColor, // Same AppBar color
    elevation: 2.0,
    iconTheme: const IconThemeData(color: Colors.white), // Icon color remains white
    titleTextStyle: const TextStyle(
      color: DarkThemeColors.textColor, // White text for AppBar
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.teal),
    headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.teal),
    headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.teal),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70), // Light text color
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60), // Slightly dimmed text
    bodySmall: TextStyle(fontSize: 12.0, color: Colors.white54), // Further dimmed text
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.teal, // Same button background for dark theme
    textTheme: ButtonTextTheme.primary, // White text on buttons
  ),
  cardTheme: CardTheme(
    color: Colors.grey[800], // Dark background for cards
    elevation: 4.0,
    shadowColor: Colors.black.withOpacity(0.5), // Darker shadow for cards
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal, // Same FAB color
    foregroundColor: Colors.white, // White icon color for FAB
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.teal.withOpacity(0.1), // Dark background for input fields
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0), // Rounded borders
      borderSide: const BorderSide(color: Colors.teal),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.teal), // Enabled border color
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.orange, width: 2.0), // Focused border color
    ),
    labelStyle: const TextStyle(color: Colors.teal), // Label color
    hintStyle: TextStyle(color: Colors.teal[200]), // Hint text color
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // White text color for button
      backgroundColor: Colors.teal[800], // Darker background color for ElevatedButton
      padding: const EdgeInsets.symmetric(vertical: 15), // Button height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);


















// import 'package:flutter/material.dart';
//
// ThemeData getDarkTheme() => ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.teal,
//     primaryColor: Colors.teal,
//     hintColor: Colors.orange,
//     scaffoldBackgroundColor: const Color(0xFF121212), // Dark background color
//     appBarTheme: const AppBarTheme(
//       color: Color(0xFF1F1F1F), // Dark AppBar color
//       elevation: 2.0,
//       iconTheme: IconThemeData(color: Colors.white),
//       titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     textTheme: TextTheme(
//       headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.teal[200]),
//       bodyLarge: const TextStyle(fontSize: 16.0, color: Colors.white),
//       bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
//       bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
//     ),
//     buttonTheme: const ButtonThemeData(
//       buttonColor: Colors.teal,
//       textTheme: ButtonTextTheme.primary,
//     ),
//     cardTheme: const CardTheme(
//       color: Color(0xFF1E1E1E), // Dark card color
//       elevation: 4.0,
//       shadowColor: Colors.black54, // Dark shadow color
//       margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Colors.teal,
//       foregroundColor: Colors.black, // Text color for FAB in dark mode
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: Colors.teal.withOpacity(0.1), // TextField background color
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12.0),
//         borderSide: BorderSide(color: Colors.teal[200]!),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12.0),
//         borderSide: BorderSide(color: Colors.teal[300]!),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12.0),
//         borderSide: const BorderSide(color: Colors.orange, width: 2.0),
//       ),
//       labelStyle: TextStyle(color: Colors.teal[200]),
//       hintStyle: TextStyle(color: Colors.teal[100]),
//     ),
//   );
