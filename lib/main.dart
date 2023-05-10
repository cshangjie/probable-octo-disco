import 'package:flutter/material.dart';
import 'log_screen.dart';
import 'routines_screen.dart';
import 'statistics_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(FlutterTabApp());
}

class FlutterTabApp extends StatefulWidget {
  @override
  _FlutterTabAppState createState() => _FlutterTabAppState();
}

class _FlutterTabAppState extends State<FlutterTabApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LogScreen(),
    RoutinesScreen(),
    StatisticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Log',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Routines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue, // Change the selected icon color
          unselectedItemColor: Colors.grey, // Change the unselected icon color
          backgroundColor: Colors.white, // Change the background color
        ),
      ),
    );
  }
}
