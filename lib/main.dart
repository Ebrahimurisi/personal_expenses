import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/domain/expense_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_provider.dart'; // Import your theme provider here

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseController()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()), // Add your ThemeProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Expenses',
          theme: themeProvider.isLightTheme
              ? ThemeData.light() // Light theme
              : ThemeData.dark(),  // Dark theme
          home: OnboardingScreen(), // Your main screen
        );
      },
    );
  }
}
