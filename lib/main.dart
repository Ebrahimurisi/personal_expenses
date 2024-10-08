import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_expenses/presentation/screens/onboarding.dart';
import './presentation/screens/login_screen.dart';
import './presentation/screens/singup_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Onboarding()
        // Scaffold(
    // body: Column(
    //   children: [
    //
    //       const Text("Wajdy"),
    //       Lottie.network('https://lottie.host/3fca1209-09ce-4374-b4b1-ad51230cd881/3VvKtFZ9x8.json'),
    //
    //   ],
    // ),
    // ),
    );
  }
}

