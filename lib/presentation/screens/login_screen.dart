import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_expenses/presentation/screens/singup_screen.dart';
import 'bottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Personal Expenses',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: 120,
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email TextFormField
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                  prefixIcon: const Icon(Icons.email),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Password TextFormField
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  focusedBorder: const UnderlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 7),
              // Forgot Password Link
              GestureDetector(
                onTap: () {
                  print('Forgot Password? Clicked');
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   foregroundColor: Colors.white,
                  //   backgroundColor: Colors.black38,
                  //   // Text color
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   // Button height
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationBarBottom(),
                        ),
                      ); // Perform login action
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  // style: ElevatedButton.styleFrom(
                  //   foregroundColor: Colors.white,
                  //   backgroundColor: Colors.black38,
                  //   // Text color
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   // Button height
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  icon: const Icon(FontAwesomeIcons.google),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationBarBottom(),
                        ),
                      ); // Perform login action
                    }
                  },
                  label: const Text(
                    'Sing in with Google',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 12),


              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                    'Don\'t have an account? ', style: TextStyle(color: Colors.black54),
                  ), Text(
                    'Sign Up ',
                    style: TextStyle(color: Colors.blue),)]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//
//   _signInWithGoogle()async{
//
//     final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//     try {
//
//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//
//       if(googleSignInAccount != null ){
//         final GoogleSignInAuthentication googleSignInAuthentication = await
//         googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );
//
//         await _firebaseAuth.signInWithCredential(credential);
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
//       }
//
//     }catch(e) {
//       SnackBar(content: Text('data'));
//     }
//
//
//   }
//
}

