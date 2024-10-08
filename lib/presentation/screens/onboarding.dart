import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            const Text("Wajdy"),
            Lottie.network('https://lottie.host/5b763c50-5709-4096-9a8e-81be41766778/ySi8Q4xSbB.json'),

          ],
        ),
      ),
    );
  }
}