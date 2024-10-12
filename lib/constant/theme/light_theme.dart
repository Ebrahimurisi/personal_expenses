import 'package:flutter/material.dart';
import 'package:personal_expenses/constant/theme_color/light_theme_color.dart';

ThemeData getLightTheme() => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal, // Primary color for AppBar, FAB, etc.
    hintColor: Colors.orange, // Accent color for interactive elements
    scaffoldBackgroundColor: Colors.grey[200], // Background color of the scaffold
    appBarTheme: AppBarTheme(
      color: LightThemeColors.appBarColor, // Background color of the AppBar
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white), // Color of AppBar icons
      titleTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.teal),
      headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.teal),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.teal),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.black38),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.teal, // Background color for buttons
      textTheme: ButtonTextTheme.primary, // Text color for buttons
    ),
    cardTheme: CardTheme(
      color: Colors.white, // Background color of cards
      elevation: 4.0,
      shadowColor: Colors.teal.withOpacity(0.2), // Light shadow color
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal, // FAB color
      foregroundColor: Colors.white, // Icon color on FAB
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.teal.withOpacity(0.1), // Background color for text fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded borders
        borderSide: const BorderSide(color: Colors.teal),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.teal), // Enabled border color
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.orange, width: 1.0), // Focused border color
      ),
      labelStyle: const TextStyle(color: Colors.teal), // Label color
      hintStyle: TextStyle(color: Colors.teal[200]), // Hint text color
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black54, // Text color
      backgroundColor: Colors.teal[200], // Button background color
      padding: const EdgeInsets.symmetric(vertical: 15), // Button height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  );








// ThemeData getLightTheme() => ThemeData(
//   scaffoldBackgroundColor: Colors.white24,
//   primaryColor: LightThemeColors.primaryColor,
//   // App Bar
//   appBarTheme: AppBarTheme(
//       systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: LightThemeColors.appBarColor,
//           systemStatusBarContrastEnforced:false,
//           systemNavigationBarColor: LightThemeColors.primaryColor,
//           systemNavigationBarDividerColor:LightThemeColors.appBarColor,
//           statusBarIconBrightness:Brightness.light
//       ),
//       elevation: 40,
//       toolbarHeight: 60,
//       centerTitle: true,
//       iconTheme: const IconThemeData(
//         color: Colors.grey,
//         size: 50,
//       ),
//       titleTextStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//         fontSize: 20,
//         fontFamily: 'Arvo-Bold',
//
//       ),
//       color: Colors.black54,
//   ),
//
//   textTheme: TextTheme(
//     headlineLarge: TextStyle(
//       fontFamily: 'Arvo-Bold', fo
//     ),
//   )
//
// );