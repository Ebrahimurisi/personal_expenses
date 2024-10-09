import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_expenses/presentation/screens/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Onboarding(),
    );
  }
}

