import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    body: Column(
      children: [

          Text("Wajdy"),
          Lottie.network('https://lottie.host/3fca1209-09ce-4374-b4b1-ad51230cd881/3VvKtFZ9x8.json'),

      ],
    ),
    ),
    );
  }
}

