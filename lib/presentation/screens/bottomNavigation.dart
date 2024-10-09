import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/home.dart';
import 'package:personal_expenses/presentation/screens/reports.dart';
import 'package:personal_expenses/presentation/screens/setting.dart';
import 'package:personal_expenses/main.dart';


class NavigationBarBottom extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarBottom> {
  int _currentIndex = 0; //

  // BottomNavigation Screens (Home, Reports, Settings)
  final List<Widget> _pages = [
    HomePage(),
    ReportsPage(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show current screens according to index

      // bottomNavigationBar
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex, // currentIndex
        onTap: (index) {
          setState(() {
            _currentIndex = index; // change page
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home Icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), // Reports Icon
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Settings Icon
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue, // Color of the selected bar item
        unselectedItemColor: Colors.grey, // Color of the unselected bar item
        showUnselectedLabels: true, // show labels of unselected bar items
        type: BottomNavigationBarType.fixed, // type of BottomNavigationBar
      ),
    );
  }
}
