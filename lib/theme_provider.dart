import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // Default theme is light
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  // Load the theme preference from SharedPreferences
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLightTheme = prefs.getBool('isLightTheme') ?? true; // Default to light theme
    notifyListeners();
  }

  // Toggle the theme and save preference
  Future<void> toggleTheme(bool isLight) async {
    _isLightTheme = isLight;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLightTheme', isLight);
    notifyListeners();
  }
}
