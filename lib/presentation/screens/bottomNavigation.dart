import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/home.dart';
import 'package:personal_expenses/presentation/screens/reports.dart';
import 'package:personal_expenses/presentation/screens/setting.dart';



class NavigationBarBottom extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarBottom> {
  int _currentIndex = 0; // الفهرس الحالي لعنصر التنقل النشط

  // الشاشات الخاصة بالصفحات الثلاث (Home, Reports, Settings)
  final List<Widget> _pages = [
    HomePage(),
    ReportsPage(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // عرض الصفحة الحالية بناءً على الفهرس

      // شريط التنقل السفلي
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex, // العنصر النشط حاليًا
        onTap: (index) {
          setState(() {
            _currentIndex = index; // تغيير الصفحة عند النقر على عنصر في الشريط
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // أيقونة الصفحة الرئيسية
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), // أيقونة التقارير
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // أيقونة الإعدادات
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue, // لون العنصر النشط
        unselectedItemColor: Colors.grey, // لون العناصر غير النشطة
        showUnselectedLabels: true, // إظهار نص العنصر حتى لو كان غير نشط
        type: BottomNavigationBarType.fixed, // نوع الشريط (ثابت)
      ),
    );
  }
}
