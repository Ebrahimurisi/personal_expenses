import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/bottomNavigation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    home: NavigationBarBottom(),
    );
  }
}

