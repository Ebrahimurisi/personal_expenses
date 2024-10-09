import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './presentation/screens/singup_screen.dart';
import './presentation/screens/onboarding.dart';
void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

 const MyApp ({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: OnboardingScreen(),

    );


  }
}

