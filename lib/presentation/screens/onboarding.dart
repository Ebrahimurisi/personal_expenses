import 'package:flutter/material.dart';
import 'package:personal_expenses/data/model/onboarding_info.dart';
import 'package:personal_expenses/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  static OnboardingItem control = OnboardingItem();

  @override
  void initState() {
    super.initState();
    _checkFirstTimeLaunch();
  }

  // Check if the onboarding screen should be shown
  _checkFirstTimeLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (seenOnboarding) {
      // If the user has seen the onboarding screen, go directly to SignUpScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  // Mark onboarding as completed and navigate to SignUpScreen
  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: control.items.length,
              itemBuilder: (context, index) => OnboardingContent(
                title: control.items[index].title,
                subtitle: control.items[index].subtitle,
                image: control.items[index].image,
              ),
            ),
          ),
          // Bottom navigation dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              control.items.length,
                  (index) => buildDot(index: index),
            ),
          ),
          // Button to Proceed
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (currentPage == control.items.length - 1) {
                  // Mark onboarding as completed and navigate to SignUpScreen if it's the last page
                  _completeOnboarding();
                } else {
                  // Go to the next page
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(currentPage == control.items.length - 1
                  ? "Get Started"
                  : "Next"),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build dots indicator
  Widget buildDot({required int index}) {
    return Container(
      height: 10,
      width: currentPage == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// Widget to create each page content
class OnboardingContent extends StatelessWidget {
  final String title, subtitle, image;

  const OnboardingContent({super.key, 
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(image, height: 300, width: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}