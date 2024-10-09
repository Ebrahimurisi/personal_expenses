import 'package:flutter/material.dart';
import 'package:personal_expenses/constant/theme/dark_theme.dart';
import 'package:personal_expenses/data/cache_manager_helper/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './presentation/screens/singup_screen.dart';
import './presentation/screens/onboarding.dart';
import 'constant/theme/light_theme.dart';
import 'data/local_database/database.dart';
import 'theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheManager.initializeCache();
  runApp(ChangeNotifierProvider(
    create: (_) =>
    ThemeProvider()
      ..loadTheme(),
    child: const MyApp(),));
  }

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isLightTheme = true; // Default theme
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Load theme preference
  //   _loadTheme();
  // }
  //
  // // Function to load the saved theme from SharedPreferences
  // Future<void> _loadTheme() async {
  //   bool? savedTheme = await CacheManager.getData(key: 'themeMode');
  //   setState(() {
  //     isLightTheme = savedTheme ?? true; // If no saved theme, default to false
  //   });
  // }
  //
  // void _toggleTheme(bool value) {
  //   setState(() {
  //     isLightTheme = value;
  //     CacheManager.saveData(key: 'themeMode', value: value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
            theme: getLightTheme(),
            // Light theme data
            darkTheme: getDarkTheme(),
            // Dark theme data
            themeMode: themeProvider.isLightTheme ? ThemeMode.light : ThemeMode
                .dark,
          );
        });
  }
}

