// import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal_expenses/constant/theme/light_theme.dart';
import 'package:personal_expenses/constant/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/domain/expense_provider.dart';
import 'firebase_options.dart';
import 'theme_provider.dart'; // Import your theme provider here
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyBJCdtTMT5hfaeiU8F6-3CWdi9TNWWWHB0",
//         appId: "1:153936973017:android:c397f2a19e6f1b71ef82c8",
//         messagingSenderId: "153936973017",
//         projectId: "my-project-bd6cb",
//         // Your web Firebase config options
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ExpenseController()),
//         ChangeNotifierProvider(create: (context) => ThemeProvider()), // Add your ThemeProvider
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExpenseController()),
          ChangeNotifierProvider(create: (context) => themeProvider), // Add your ThemeProvider
        ],
        child: const MyApp(),
      ),);
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Expenses',
          theme: themeProvider.isLightTheme
              ? getLightTheme() // Light theme
              : getDarkTheme(),  // Dark theme
          home: const OnboardingScreen(), // Your main screen
        );
      },
    );
  }
}
