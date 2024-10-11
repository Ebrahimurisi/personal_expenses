// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LogoFadeInScreen extends StatefulWidget {
//   @override
//   _LogoFadeInScreenState createState() => _LogoFadeInScreenState();
// }
//
// class _LogoFadeInScreenState extends State<LogoFadeInScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacity;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//
//     // بدء الرسوم المتحركة
//     controller.forward().then(() {
//       // الانتقال إلى الصفحة الأخرى بعد 2 ثانية
//       Future.delayed(const Duration(seconds:2 ), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) =>Login()), // استبدل بـ NextScreen
//         );
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: FadeTransition(
//           opacity: _opacity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/Screenshot (4).png', width: 700, height: 500), // استبدل بمسار شعارك
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // الصفحة التالية (استبدل هذه الصفحة بما تريده)
// class Login extends StatelessWidget {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var nameController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Container(
//           alignment: Alignment.center,
//           child: Text(
//             'تسجيل الدخول',
//             style: TextStyle(color: Colors.white, fontSize: 28.0),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(0),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Image.asset('assets/images/Screenshot (4).png'),
//                 SizedBox(height: (0)),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'قم بالتسجيل',
//                           style: TextStyle(
//                             height: 0.0,
//                             color: Colors.orange,
//                             fontSize: 19,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         ' ليس لديك حساب؟',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: (10.0)),
//                 _buildTextField(nameController, TextInputType.name, 'الاسم', Icons.edit),
//                 SizedBox(height: 20.0),
//                 _buildTextField(emailController, TextInputType.emailAddress, 'البريد الاكتروني', Icons.email),
//                 SizedBox(height: 20.0),
//                 _buildTextField(passwordController, TextInputType.visiblePassword, 'كلمه السر', Icons.lock, obscureText: true),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // حفظ بيانات المستخدم باستخدام المزود
//
//
//                     // حفظ البيانات في SharedPreferences
//                     SharedPreferences prefs = await SharedPreferences.getInstance();
//                     await prefs.setString('name', nameController.text);
//                     await prefs.setString('email', emailController.text);
//                     await prefs.setString('password', passwordController.text);
//
//                     // الانتقال إلى الشاشة الرئيسية
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => MainScreen(onThemeChanged: (bool value) {  }, isDarkMode: true,)),
//                     );
//                   },
//                   child: Text('تسجيل الدخول'),
//                 ),
//                 SizedBox(height: (10.0)),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'عند استخدامك لتطبيق مندوب فانك توافق على شروط الاستخدام وسياسه الخصوصيه الخاصه بنا',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.black, fontSize: 15),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text('موافق', style: TextStyle(color: Colors.orange, fontSize: 15)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, TextInputType keyboardType, String labelText, IconData prefixIcon, {bool obscureText = false}) {
//     return Container(
//       width: 300,
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           labelText: labelText,
//           labelStyle: TextStyle(color: Colors.grey),
//           prefixIcon: Icon(prefixIcon, color: Colors.grey),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.orange, width: 2.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.orange),
//           ),
//         ),
//       ),
//     );
//   }
// }